/*!
 * # Fomantic-UI - Sticky
 * https://github.com/fomantic/Fomantic-UI/
 *
 *
 * Released under the MIT license
 * https://opensource.org/licenses/MIT
 *
 */

(function ($, window, document) {
    'use strict';

    function isFunction(obj) {
        return typeof obj === 'function' && typeof obj.nodeType !== 'number';
    }

    window = window !== undefined && window.Math === Math
        ? window
        : globalThis;

    $.fn.sticky = function (parameters) {
        let $allModules = $(this);
        let $document = $(document);

        let time = Date.now();
        let performance = [];

        let query = arguments[0];
        let methodInvoked = typeof query === 'string';
        let queryArguments = [].slice.call(arguments, 1);
        let contextCheck = function (context, win) {
            let $context;
            if ([window, document].indexOf(context) >= 0) {
                $context = $(context);
            } else {
                $context = $(win.document).find(context);
                if ($context.length === 0) {
                    $context = win.frameElement ? contextCheck(context, win.parent) : window;
                }
            }

            return $context;
        };
        let returnedValue;

        $allModules.each(function () {
            let settings = $.isPlainObject(parameters)
                ? $.extend(true, {}, $.fn.sticky.settings, parameters)
                : $.extend({}, $.fn.sticky.settings);

            let className = settings.className;
            let namespace = settings.namespace;
            let error = settings.error;

            let eventNamespace = '.' + namespace;
            let moduleNamespace = 'module-' + namespace;

            let $module = $(this);
            let $window = $(window);
            let $scroll = contextCheck(settings.scrollContext, window);
            let $container;
            let $context;

            let instance = $module.data(moduleNamespace);

            let element = this;

            let documentObserver;
            let observer;
            let module;

            module = {

                initialize: function () {
                    module.determineContainer();
                    module.determineContext();
                    module.verbose('Initializing sticky', settings, $container);

                    module.save.positions();
                    module.checkErrors();
                    module.bind.events();

                    if (settings.observeChanges) {
                        module.observeChanges();
                    }
                    module.instantiate();
                },

                instantiate: function () {
                    module.verbose('Storing instance of module', module);
                    instance = module;
                    $module
                        .data(moduleNamespace, module);
                },

                destroy: function () {
                    module.verbose('Destroying previous instance');
                    module.reset();
                    if (documentObserver) {
                        documentObserver.disconnect();
                    }
                    if (observer) {
                        observer.disconnect();
                    }
                    $window
                        .off('load' + eventNamespace, module.event.load)
                        .off('resize' + eventNamespace, module.event.resize);
                    $scroll
                        .off('scrollchange' + eventNamespace, module.event.scrollchange);
                    $module.removeData(moduleNamespace);
                },

                observeChanges: function () {
                    documentObserver = new MutationObserver(module.event.documentChanged);
                    observer = new MutationObserver(module.event.changed);
                    documentObserver.observe(document, {
                        childList: true,
                        subtree: true,
                    });
                    observer.observe(element, {
                        childList: true,
                        subtree: true,
                    });
                    observer.observe($context[0], {
                        childList: true,
                        subtree: true,
                    });
                    module.debug('Setting up mutation observer', observer);
                },

                determineContainer: function () {
                    $container = settings.container ? contextCheck(settings.container, window) : $module.offsetParent();
                },

                determineContext: function () {
                    $context = settings.context ? contextCheck(settings.context, window) : $container;
                    if ($context.length === 0) {
                        module.error(error.invalidContext, settings.context, $module);
                    }
                },

                checkErrors: function () {
                    if (module.is.hidden()) {
                        module.error(error.visible, $module);
                    }
                    if (module.cache.element.height > module.cache.context.height) {
                        module.reset();
                        module.error(error.elementSize, $module);
                    }
                },

                bind: {
                    events: function () {
                        $window
                            .on('load' + eventNamespace, module.event.load)
                            .on('resize' + eventNamespace, module.event.resize);
                        // pub/sub pattern
                        $scroll
                            .off('scroll' + eventNamespace)
                            .on('scroll' + eventNamespace, module.event.scroll)
                            .on('scrollchange' + eventNamespace, module.event.scrollchange);
                    },
                },

                event: {
                    changed: function (mutations) {
                        clearTimeout(module.timer);
                        module.timer = setTimeout(function () {
                            module.verbose('DOM tree modified, updating sticky menu', mutations);
                            module.refresh();
                        }, 100);
                    },
                    documentChanged: function (mutations) {
                        [].forEach.call(mutations, function (mutation) {
                            if (mutation.removedNodes) {
                                [].forEach.call(mutation.removedNodes, function (node) {
                                    if (node === element || $(node).find(element).length > 0) {
                                        module.debug('Element removed from DOM, tearing down events');
                                        module.destroy();
                                    }
                                });
                            }
                        });
                    },
                    load: function () {
                        module.verbose('Page contents finished loading');
                        requestAnimationFrame(module.refresh);
                    },
                    resize: function () {
                        module.verbose('Window resized');
                        requestAnimationFrame(module.refresh);
                    },
                    scroll: function () {
                        requestAnimationFrame(function () {
                            $scroll.triggerHandler('scrollchange' + eventNamespace, $scroll.scrollTop());
                        });
                    },
                    scrollchange: function (event, scrollPosition) {
                        module.stick(scrollPosition);
                        settings.onScroll.call(element);
                    },
                },

                refresh: function (hardRefresh) {
                    module.reset();
                    if (!settings.context) {
                        module.determineContext();
                    }
                    if (hardRefresh) {
                        module.determineContainer();
                    }
                    module.save.positions();
                    module.stick();
                    settings.onReposition.call(element);
                },

                supports: {
                    sticky: function () {
                        let $element = $('<div/>');
                        $element.addClass(className.supported);

                        return $element.css('position').match('sticky');
                    },
                },

                save: {
                    lastScroll: function (scroll) {
                        module.lastScroll = scroll;
                    },
                    elementScroll: function (scroll) {
                        module.elementScroll = scroll;
                    },
                    positions: function () {
                        let scrollContext = {
                            height: $scroll.height(),
                        };
                        let element = {
                            margin: {
                                top: parseInt($module.css('margin-top'), 10),
                                bottom: parseInt($module.css('margin-bottom'), 10),
                            },
                            offset: $module.offset(),
                            width: $module.outerWidth(),
                            height: $module.outerHeight(),
                        };
                        let context = {
                            offset: $context.offset(),
                            height: $context.outerHeight(),
                        };
                        if (!module.is.standardScroll()) {
                            module.debug('Non-standard scroll. Removing scroll offset from element offset');

                            scrollContext.top = $scroll.scrollTop();
                            scrollContext.left = $scroll.scrollLeft();

                            element.offset.top += scrollContext.top;
                            context.offset.top += scrollContext.top;
                            element.offset.left += scrollContext.left;
                            context.offset.left += scrollContext.left;
                        }
                        module.cache = {
                            fits: (element.height + settings.offset) <= scrollContext.height,
                            sameHeight: element.height === context.height,
                            scrollContext: {
                                height: scrollContext.height,
                            },
                            element: {
                                margin: element.margin,
                                top: element.offset.top - element.margin.top,
                                left: element.offset.left,
                                width: element.width,
                                height: element.height,
                                bottom: element.offset.top + element.height,
                            },
                            context: {
                                top: context.offset.top,
                                height: context.height,
                                bottom: context.offset.top + context.height,
                            },
                        };
                        module.set.containerSize();

                        module.stick();
                        module.debug('Caching element positions', module.cache);
                    },
                },

                get: {
                    direction: function (scroll) {
                        let direction = 'down';
                        scroll = scroll || $scroll.scrollTop();
                        if (module.lastScroll && module.lastScroll > scroll) {
                            direction = 'up';
                        }

                        return direction;
                    },
                    scrollChange: function (scroll) {
                        scroll = scroll || $scroll.scrollTop();

                        return module.lastScroll
                            ? scroll - module.lastScroll
                            : 0;
                    },
                    currentElementScroll: function () {
                        if (module.elementScroll) {
                            return module.elementScroll;
                        }

                        return module.is.top()
                            ? Math.abs(parseInt($module.css('top'), 10)) || 0
                            : Math.abs(parseInt($module.css('bottom'), 10)) || 0;
                    },

                    elementScroll: function (scroll) {
                        scroll = scroll || $scroll.scrollTop();
                        let element = module.cache.element;
                        let scrollContext = module.cache.scrollContext;
                        let delta = module.get.scrollChange(scroll);
                        let maxScroll = element.height - scrollContext.height + settings.offset;
                        let elementScroll = module.get.currentElementScroll();
                        let possibleScroll = elementScroll + delta;
                        if (module.cache.fits || possibleScroll < 0) {
                            elementScroll = 0;
                        } else if (possibleScroll > maxScroll) {
                            elementScroll = maxScroll;
                        } else {
                            elementScroll = possibleScroll;
                        }

                        return elementScroll;
                    },
                },

                remove: {
                    lastScroll: function () {
                        delete module.lastScroll;
                    },
                    elementScroll: function () {
                        delete module.elementScroll;
                    },
                    minimumSize: function () {
                        $container
                            .css('min-height', '');
                    },
                    offset: function () {
                        $module.css('margin-top', '');
                    },
                },

                set: {
                    offset: function () {
                        module.verbose('Setting offset on element', settings.offset);
                        $module
                            .css('margin-top', settings.offset);
                    },
                    containerSize: function () {
                        let tagName = $container[0].tagName;
                        if (tagName === 'HTML' || tagName === 'body') {
                            module.determineContainer();
                        } else {
                            let tallestHeight = Math.max(module.cache.context.height, module.cache.element.height);
                            if (tallestHeight - $container.outerHeight() > settings.jitter) {
                                module.debug('Context is taller than container. Specifying exact height for container', module.cache.context.height);
                                $container.css({
                                    height: tallestHeight,
                                });
                            } else {
                                $container.css({
                                    height: '',
                                });
                            }
                            if (Math.abs($container.outerHeight() - module.cache.context.height) > settings.jitter) {
                                module.debug('Context has padding, specifying exact height for container', module.cache.context.height);
                                $container.css({
                                    height: module.cache.context.height,
                                });
                            }
                        }
                    },
                    minimumSize: function () {
                        let element = module.cache.element;
                        $container
                            .css('min-height', element.height);
                    },
                    scroll: function (scroll) {
                        module.debug('Setting scroll on element', scroll);
                        if (module.elementScroll === scroll) {
                            return;
                        }
                        if (module.is.top()) {
                            $module
                                .css('bottom', '')
                                .css('top', -scroll + 'px');
                        }
                        if (module.is.bottom()) {
                            $module
                                .css('top', '')
                                .css('bottom', scroll + 'px');
                        }
                    },
                    size: function () {
                        if (module.cache.element.height !== 0 && module.cache.element.width !== 0) {
                            element.style.setProperty('width', module.cache.element.width + 'px', 'important');
                            element.style.setProperty('height', module.cache.element.height + 'px', 'important');
                        }
                    },
                },

                is: {
                    standardScroll: function () {
                        return $scroll[0] === window;
                    },
                    top: function () {
                        return $module.hasClass(className.top);
                    },
                    bottom: function () {
                        return $module.hasClass(className.bottom);
                    },
                    initialPosition: function () {
                        return !module.is.fixed() && !module.is.bound();
                    },
                    hidden: function () {
                        return !$module.is(':visible');
                    },
                    bound: function () {
                        return $module.hasClass(className.bound);
                    },
                    fixed: function () {
                        return $module.hasClass(className.fixed);
                    },
                },

                stick: function (scrollPosition) {
                    let cachedPosition = scrollPosition || $scroll.scrollTop();
                    let cache = module.cache;
                    let fits = cache.fits;
                    let sameHeight = cache.sameHeight;
                    let element = cache.element;
                    let scrollContext = cache.scrollContext;
                    let context = cache.context;
                    let offset = module.is.bottom() && settings.pushing
                        ? settings.bottomOffset
                        : settings.offset;
                    let scroll = {
                        top: cachedPosition + offset,
                        bottom: cachedPosition + offset + scrollContext.height,
                    };
                    let elementScroll = fits
                        ? 0
                        : module.get.elementScroll(scroll.top);

                    // shorthand
                    let doesntFit = !fits;
                    let elementVisible = element.height !== 0;
                    if (elementVisible && !sameHeight) {
                        if (module.is.initialPosition()) {
                            if (scroll.top >= context.bottom) {
                                module.debug('Initial element position is bottom of container');
                                module.bindBottom();
                            } else if (scroll.top > element.top) {
                                if ((element.height + scroll.top - elementScroll) >= context.bottom && element.height < context.height) {
                                    module.debug('Initial element position is bottom of container');
                                    module.bindBottom();
                                } else {
                                    module.debug('Initial element position is fixed');
                                    module.fixTop();
                                }
                            }
                        } else if (module.is.fixed()) {
                            if (module.is.top()) {
                                if (scroll.top <= element.top) {
                                    module.debug('Fixed element reached top of container');
                                    module.setInitialPosition();
                                } else if ((element.height + scroll.top - elementScroll) >= context.bottom) {
                                    module.debug('Fixed element reached bottom of container');
                                    module.bindBottom();
                                } else if (doesntFit) { // scroll element if larger than screen
                                    module.set.scroll(elementScroll);
                                    module.save.lastScroll(scroll.top);
                                    module.save.elementScroll(elementScroll);
                                }
                            } else if (module.is.bottom()) {
                                if ((scroll.bottom - element.height) <= element.top) { // top edge
                                    module.debug('Bottom fixed rail has reached top of container');
                                    module.setInitialPosition();
                                } else if (scroll.bottom >= context.bottom) { // bottom edge
                                    module.debug('Bottom fixed rail has reached bottom of container');
                                    module.bindBottom();
                                } else if (doesntFit) { // scroll element if larger than screen
                                    module.set.scroll(elementScroll);
                                    module.save.lastScroll(scroll.top);
                                    module.save.elementScroll(elementScroll);
                                }
                            }
                        } else if (module.is.bottom()) {
                            if (scroll.top <= element.top) {
                                module.debug('Jumped from bottom fixed to top fixed, most likely used home/end button');
                                module.setInitialPosition();
                            } else {
                                if (settings.pushing) {
                                    if (module.is.bound() && scroll.bottom <= context.bottom) {
                                        module.debug('Fixing bottom attached element to bottom of browser.');
                                        module.fixBottom();
                                    }
                                } else {
                                    if (module.is.bound() && (scroll.top <= context.bottom - element.height)) {
                                        module.debug('Fixing bottom attached element to top of browser.');
                                        module.fixTop();
                                    }
                                }
                            }
                        }
                    }
                },

                bindTop: function () {
                    module.debug('Binding element to top of parent container');
                    module.remove.offset();
                    if (settings.setSize) {
                        module.set.size();
                    }
                    $module
                        .css({
                            left: '',
                            top: '',
                            marginBottom: '',
                        })
                        .removeClass(className.fixed)
                        .removeClass(className.bottom)
                        .addClass(className.bound)
                        .addClass(className.top);
                    settings.onTop.call(element);
                    settings.onUnstick.call(element);
                },
                bindBottom: function () {
                    module.debug('Binding element to bottom of parent container');
                    module.remove.offset();
                    if (settings.setSize) {
                        module.set.size();
                    }
                    $module
                        .css({
                            left: '',
                            top: '',
                        })
                        .removeClass(className.fixed)
                        .removeClass(className.top)
                        .addClass(className.bound)
                        .addClass(className.bottom);
                    settings.onBottom.call(element);
                    settings.onUnstick.call(element);
                },

                setInitialPosition: function () {
                    module.debug('Returning to initial position');
                    module.unfix();
                    module.unbind();
                },

                fixTop: function () {
                    module.debug('Fixing element to top of page');
                    if (settings.setSize) {
                        module.set.size();
                    }
                    module.set.minimumSize();
                    module.set.offset();
                    $module
                        .css({
                            left: module.cache.element.left,
                            bottom: '',
                            marginBottom: '',
                        })
                        .removeClass(className.bound)
                        .removeClass(className.bottom)
                        .addClass(className.fixed)
                        .addClass(className.top);
                    settings.onStick.call(element);
                },

                fixBottom: function () {
                    module.debug('Sticking element to bottom of page');
                    if (settings.setSize) {
                        module.set.size();
                    }
                    module.set.minimumSize();
                    module.set.offset();
                    $module
                        .css({
                            left: module.cache.element.left,
                            bottom: '',
                            marginBottom: '',
                        })
                        .removeClass(className.bound)
                        .removeClass(className.top)
                        .addClass(className.fixed)
                        .addClass(className.bottom);
                    settings.onStick.call(element);
                },

                unbind: function () {
                    if (module.is.bound()) {
                        module.debug('Removing container bound position on element');
                        module.remove.offset();
                        $module
                            .removeClass(className.bound)
                            .removeClass(className.top)
                            .removeClass(className.bottom);
                    }
                },

                unfix: function () {
                    if (module.is.fixed()) {
                        module.debug('Removing fixed position on element');
                        module.remove.minimumSize();
                        module.remove.offset();
                        $module
                            .removeClass(className.fixed)
                            .removeClass(className.top)
                            .removeClass(className.bottom);
                        settings.onUnstick.call(element);
                    }
                },

                reset: function () {
                    module.debug('Resetting elements position');
                    module.unbind();
                    module.unfix();
                    module.resetCSS();
                    module.remove.offset();
                    module.remove.lastScroll();
                },

                resetCSS: function () {
                    $module
                        .css({
                            width: '',
                            height: '',
                        });
                    $container
                        .css({
                            height: '',
                        });
                },

                setting: function (name, value) {
                    if ($.isPlainObject(name)) {
                        $.extend(true, settings, name);
                    } else if (value !== undefined) {
                        settings[name] = value;
                    } else {
                        return settings[name];
                    }
                },
                internal: function (name, value) {
                    if ($.isPlainObject(name)) {
                        $.extend(true, module, name);
                    } else if (value !== undefined) {
                        module[name] = value;
                    } else {
                        return module[name];
                    }
                },
                debug: function () {
                    if (!settings.silent && settings.debug) {
                        if (settings.performance) {
                            module.performance.log(arguments);
                        } else {
                            module.debug = Function.prototype.bind.call(console.info, console, settings.name + ':');
                            module.debug.apply(console, arguments);
                        }
                    }
                },
                verbose: function () {
                    if (!settings.silent && settings.verbose && settings.debug) {
                        if (settings.performance) {
                            module.performance.log(arguments);
                        } else {
                            module.verbose = Function.prototype.bind.call(console.info, console, settings.name + ':');
                            module.verbose.apply(console, arguments);
                        }
                    }
                },
                error: function () {
                    if (!settings.silent) {
                        module.error = Function.prototype.bind.call(console.error, console, settings.name + ':');
                        module.error.apply(console, arguments);
                    }
                },
                performance: {
                    log: function (message) {
                        let currentTime;
                        let executionTime;
                        let previousTime;
                        if (settings.performance) {
                            currentTime = Date.now();
                            previousTime = time || currentTime;
                            executionTime = currentTime - previousTime;
                            time = currentTime;
                            performance.push({
                                Name: message[0],
                                Arguments: [].slice.call(message, 1) || '',
                                Element: element,
                                'Execution Time': executionTime,
                            });
                        }
                        clearTimeout(module.performance.timer);
                        module.performance.timer = setTimeout(function () {
                            module.performance.display();
                        }, 0);
                    },
                    display: function () {
                        let title = settings.name + ':';
                        let totalTime = 0;
                        time = false;
                        clearTimeout(module.performance.timer);
                        $.each(performance, function (index, data) {
                            totalTime += data['Execution Time'];
                        });
                        title += ' ' + totalTime + 'ms';
                        if (performance.length > 0) {
                            console.groupCollapsed(title);
                            if (console.table) {
                                console.table(performance);
                            } else {
                                $.each(performance, function (index, data) {
                                    console.log(data.Name + ': ' + data['Execution Time'] + 'ms');
                                });
                            }
                            console.groupEnd();
                        }
                        performance = [];
                    },
                },
                invoke: function (query, passedArguments, context) {
                    let object = instance;
                    let maxDepth;
                    let found;
                    let response;
                    passedArguments = passedArguments || queryArguments;
                    context = context || element;
                    if (typeof query === 'string' && object !== undefined) {
                        query = query.split(/[ .]/);
                        maxDepth = query.length - 1;
                        $.each(query, function (depth, value) {
                            let camelCaseValue = depth !== maxDepth
                                ? value + query[depth + 1].charAt(0).toUpperCase() + query[depth + 1].slice(1)
                                : query;
                            if ($.isPlainObject(object[camelCaseValue]) && (depth !== maxDepth)) {
                                object = object[camelCaseValue];
                            } else if (object[camelCaseValue] !== undefined) {
                                found = object[camelCaseValue];

                                return false;
                            } else if ($.isPlainObject(object[value]) && (depth !== maxDepth)) {
                                object = object[value];
                            } else if (object[value] !== undefined) {
                                found = object[value];

                                return false;
                            } else {
                                module.error(error.method, query);

                                return false;
                            }
                        });
                    }
                    if (isFunction(found)) {
                        response = found.apply(context, passedArguments);
                    } else if (found !== undefined) {
                        response = found;
                    }
                    if (Array.isArray(returnedValue)) {
                        returnedValue.push(response);
                    } else if (returnedValue !== undefined) {
                        returnedValue = [returnedValue, response];
                    } else if (response !== undefined) {
                        returnedValue = response;
                    }

                    return found;
                },
            };

            if (methodInvoked) {
                if (instance === undefined) {
                    module.initialize();
                }
                module.invoke(query);
            } else {
                if (instance !== undefined) {
                    instance.invoke('destroy');
                }
                module.initialize();
            }
        });

        return returnedValue !== undefined
            ? returnedValue
            : this;
    };

    $.fn.sticky.settings = {

        name: 'Sticky',
        namespace: 'sticky',

        silent: false,
        debug: false,
        verbose: true,
        performance: true,

        // whether to stick in the opposite direction on scroll up
        pushing: false,

        context: false,
        container: false,

        // Context to watch scroll events
        scrollContext: window,

        // Offset to adjust scroll
        offset: 0,

        // Offset to adjust scroll when attached to bottom of screen
        bottomOffset: 0,

        // will only set container height if the difference between context and container is larger than this number
        jitter: 5,

        // set width of the sticky element when it is fixed to page (used to make sure 100% width is maintained if no fixed size set)
        setSize: true,

        // Whether to automatically observe changes with Mutation Observers
        observeChanges: false,

        // Called when position is recalculated
        onReposition: function () {},

        // Called on each scroll
        onScroll: function () {},

        // Called when the element is stuck to viewport
        onStick: function () {},

        // Called when the element is unstuck from viewport
        onUnstick: function () {},

        // Called when element reaches top of context
        onTop: function () {},

        // Called when element reaches bottom of context
        onBottom: function () {},

        error: {
            visible: 'Element is hidden, you must call refresh after element becomes visible. Use silent setting to suppress this warning in production.',
            method: 'The method you called is not defined.',
            invalidContext: 'Context specified does not exist',
            elementSize: 'Sticky element is larger than its container, cannot create sticky.',
        },

        className: {
            bound: 'bound',
            fixed: 'fixed',
            supported: 'native',
            top: 'top',
            bottom: 'bottom',
        },

    };
})(jQuery, window, document);
