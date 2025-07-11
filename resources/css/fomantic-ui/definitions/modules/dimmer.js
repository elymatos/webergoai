/*!
 * # Fomantic-UI - Dimmer
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

    $.fn.dimmer = function (parameters) {
        let $allModules = $(this);

        let time = Date.now();
        let performance = [];

        let query = arguments[0];
        let methodInvoked = typeof query === 'string';
        let queryArguments = [].slice.call(arguments, 1);

        let returnedValue;

        $allModules.each(function () {
            let settings = $.isPlainObject(parameters)
                ? $.extend(true, {}, $.fn.dimmer.settings, parameters)
                : $.extend({}, $.fn.dimmer.settings);

            let selector = settings.selector;
            let namespace = settings.namespace;
            let className = settings.className;
            let error = settings.error;

            let eventNamespace = '.' + namespace;
            let moduleNamespace = 'module-' + namespace;

            let clickEvent = 'ontouchstart' in document.documentElement
                ? 'touchstart'
                : 'click';

            let $module = $(this);
            let $dimmer;
            let $dimmable;

            let element = this;
            let instance = $module.data(moduleNamespace);
            let module;

            module = {

                preinitialize: function () {
                    if (module.is.dimmer()) {
                        $dimmable = $module.parent();
                        $dimmer = $module;
                    } else {
                        $dimmable = $module;
                        if (module.has.dimmer()) {
                            $dimmer = settings.dimmerName
                                ? $dimmable.find(selector.dimmer).filter('.' + settings.dimmerName)
                                : $dimmable.find(selector.dimmer);
                        } else {
                            $dimmer = module.create();
                        }
                    }
                },

                initialize: function () {
                    module.debug('Initializing dimmer', settings);

                    module.bind.events();
                    module.set.dimmable();
                    module.instantiate();
                },

                instantiate: function () {
                    module.verbose('Storing instance of module', module);
                    instance = module;
                    $module
                        .data(moduleNamespace, instance);
                },

                destroy: function () {
                    module.verbose('Destroying previous module', $dimmer);
                    module.unbind.events();
                    module.remove.variation();
                    $dimmable
                        .off(eventNamespace);
                },

                bind: {
                    events: function () {
                        if (settings.on === 'hover') {
                            $dimmable
                                .on('mouseenter' + eventNamespace, module.show)
                                .on('mouseleave' + eventNamespace, module.hide);
                        } else if (settings.on === 'click') {
                            $dimmable
                                .on(clickEvent + eventNamespace, module.toggle);
                        }
                        if (module.is.page()) {
                            module.debug('Setting as a page dimmer', $dimmable);
                            module.set.pageDimmer();
                        }

                        if (module.is.closable()) {
                            module.verbose('Adding dimmer close event', $dimmer);
                            $dimmable
                                .on(clickEvent + eventNamespace, selector.dimmer, module.event.click);
                        }
                    },
                },

                unbind: {
                    events: function () {
                        $module
                            .removeData(moduleNamespace);
                        $dimmable
                            .off(eventNamespace);
                    },
                },

                event: {
                    click: function (event) {
                        module.verbose('Determining if event occurred on dimmer', event);
                        if ($dimmer.find(event.target).length === 0 || $(event.target).is(selector.content)) {
                            module.hide();
                            event.stopImmediatePropagation();
                        }
                    },
                },

                addContent: function (element) {
                    let $content = $(element);
                    module.debug('Add content to dimmer', $content);
                    if ($content.parent()[0] !== $dimmer[0]) {
                        $content.detach().appendTo($dimmer);
                    }
                },

                create: function () {
                    let $element = $(settings.template.dimmer(settings));
                    if (settings.dimmerName) {
                        module.debug('Creating named dimmer', settings.dimmerName);
                        $element.addClass(settings.dimmerName);
                    }
                    $element
                        .appendTo($dimmable);

                    return $element;
                },

                show: function (callback) {
                    callback = isFunction(callback)
                        ? callback
                        : function () {};
                    if ((!module.is.dimmed() || module.is.animating()) && module.is.enabled()) {
                        if (settings.onShow.call(element) === false) {
                            module.verbose('Show callback returned false cancelling dimmer show');

                            return;
                        }
                        module.debug('Showing dimmer', $dimmer, settings);
                        module.set.variation();
                        module.animate.show(callback);
                        settings.onChange.call(element);
                    } else {
                        module.debug('Dimmer is already shown or disabled');
                    }
                },

                hide: function (callback) {
                    callback = isFunction(callback)
                        ? callback
                        : function () {};
                    if (module.is.dimmed() || module.is.animating()) {
                        if (settings.onHide.call(element) === false) {
                            module.verbose('Hide callback returned false cancelling dimmer hide');

                            return;
                        }
                        module.debug('Hiding dimmer', $dimmer);
                        module.animate.hide(callback);
                        settings.onChange.call(element);
                    } else {
                        module.debug('Dimmer is not visible');
                    }
                },

                toggle: function () {
                    module.verbose('Toggling dimmer visibility', $dimmer);
                    if (!module.is.dimmed()) {
                        module.show();
                    } else {
                        if (module.is.closable()) {
                            module.hide();
                        }
                    }
                },

                animate: {
                    show: function (callback) {
                        callback = isFunction(callback)
                            ? callback
                            : function () {};
                        if (settings.useCSS && $.fn.transition !== undefined) {
                            if (settings.useFlex) {
                                module.debug('Using flex dimmer');
                                module.remove.legacy();
                            } else {
                                module.debug('Using legacy non-flex dimmer');
                                module.set.legacy();
                            }
                            if (settings.opacity !== 'auto') {
                                module.set.opacity();
                            }
                            $dimmer
                                .transition({
                                    debug: settings.debug,
                                    verbose: settings.verbose,
                                    silent: settings.silent,
                                    displayType: settings.useFlex
                                        ? 'flex'
                                        : 'block',
                                    animation: (settings.transition.showMethod || settings.transition) + ' in',
                                    queue: false,
                                    duration: module.get.duration(),
                                    useFailSafe: true,
                                    onStart: function () {
                                        module.set.dimmed();
                                    },
                                    onComplete: function () {
                                        module.set.active();
                                        settings.onVisible.call($dimmer);
                                        callback();
                                    },
                                });
                        } else {
                            module.verbose('Showing dimmer animation with javascript');
                            module.set.dimmed();
                            if (settings.opacity === 'auto') {
                                settings.opacity = 0.8;
                            }
                            $dimmer
                                .stop()
                                .css({
                                    opacity: 0,
                                    width: '100%',
                                    height: '100%',
                                })
                                .fadeTo(module.get.duration(), settings.opacity, function () {
                                    $dimmer.removeAttr('style');
                                    module.set.active();
                                    settings.onVisible.call($dimmer);
                                    callback();
                                });
                        }
                    },
                    hide: function (callback) {
                        callback = isFunction(callback)
                            ? callback
                            : function () {};
                        if (settings.useCSS && $.fn.transition !== undefined) {
                            module.verbose('Hiding dimmer with css');
                            $dimmer
                                .transition({
                                    debug: settings.debug,
                                    verbose: settings.verbose,
                                    silent: settings.silent,
                                    displayType: settings.useFlex
                                        ? 'flex'
                                        : 'block',
                                    animation: (settings.transition.hideMethod || settings.transition) + ' out',
                                    queue: false,
                                    duration: module.get.duration(),
                                    useFailSafe: true,
                                    onComplete: function () {
                                        module.remove.dimmed();
                                        module.remove.variation();
                                        module.remove.active();
                                        settings.onHidden.call($dimmer);
                                        callback();
                                    },
                                });
                        } else {
                            module.verbose('Hiding dimmer with javascript');
                            $dimmer
                                .stop()
                                .fadeOut(module.get.duration(), function () {
                                    module.remove.dimmed();
                                    module.remove.active();
                                    $dimmer.removeAttr('style');
                                    settings.onHidden.call($dimmer);
                                    callback();
                                });
                        }
                    },
                },

                get: {
                    dimmer: function () {
                        return $dimmer;
                    },
                    duration: function () {
                        if (module.is.active()) {
                            return settings.transition.hideDuration || settings.duration.hide || settings.duration;
                        }

                        return settings.transition.showDuration || settings.duration.show || settings.duration;
                    },
                },

                has: {
                    dimmer: function () {
                        if (settings.dimmerName) {
                            return $module.find(selector.dimmer).filter('.' + settings.dimmerName).length > 0;
                        }

                        return $module.find(selector.dimmer).length > 0;
                    },
                },

                is: {
                    active: function () {
                        return $dimmer.hasClass(className.active);
                    },
                    animating: function () {
                        return $dimmer.is(':animated') || $dimmer.hasClass(className.animating);
                    },
                    closable: function () {
                        if (settings.closable === 'auto') {
                            return settings.on !== 'hover';
                        }

                        return settings.closable;
                    },
                    dimmer: function () {
                        return $module.hasClass(className.dimmer);
                    },
                    dimmable: function () {
                        return $module.hasClass(className.dimmable);
                    },
                    dimmed: function () {
                        return $dimmable.hasClass(className.dimmed);
                    },
                    disabled: function () {
                        return $dimmable.hasClass(className.disabled);
                    },
                    enabled: function () {
                        return !module.is.disabled();
                    },
                    page: function () {
                        return $dimmable.is('body');
                    },
                    pageDimmer: function () {
                        return $dimmer.hasClass(className.pageDimmer);
                    },
                },

                can: {
                    show: function () {
                        return !$dimmer.hasClass(className.disabled);
                    },
                },

                set: {
                    opacity: function (opacity) {
                        let color = $dimmer.css('background-color');
                        let colorArray = color.split(',');
                        let isRGB = colorArray && colorArray.length >= 3;
                        opacity = settings.opacity === 0 ? 0 : settings.opacity || opacity;
                        if (isRGB) {
                            colorArray[2] = colorArray[2].replace(')', '');
                            colorArray[3] = opacity + ')';
                            color = colorArray.join(',');
                        } else {
                            color = 'rgba(0, 0, 0, ' + opacity + ')';
                        }
                        module.debug('Setting opacity to', opacity);
                        $dimmer.css('background-color', color);
                    },
                    legacy: function () {
                        $dimmer.addClass(className.legacy);
                    },
                    active: function () {
                        $dimmer.addClass(className.active);
                    },
                    dimmable: function () {
                        $dimmable.addClass(className.dimmable);
                    },
                    dimmed: function () {
                        $dimmable.addClass(className.dimmed);
                    },
                    pageDimmer: function () {
                        $dimmer.addClass(className.pageDimmer);
                    },
                    disabled: function () {
                        $dimmer.addClass(className.disabled);
                    },
                    variation: function (variation) {
                        variation = variation || settings.variation;
                        if (variation) {
                            $dimmer.addClass(variation);
                        }
                    },
                },

                remove: {
                    active: function () {
                        $dimmer
                            .removeClass(className.active);
                    },
                    legacy: function () {
                        $dimmer.removeClass(className.legacy);
                    },
                    dimmed: function () {
                        $dimmable.removeClass(className.dimmed);
                    },
                    disabled: function () {
                        $dimmer.removeClass(className.disabled);
                    },
                    variation: function (variation) {
                        variation = variation || settings.variation;
                        if (variation) {
                            $dimmer.removeClass(variation);
                        }
                    },
                },

                setting: function (name, value) {
                    module.debug('Changing setting', name, value);
                    if ($.isPlainObject(name)) {
                        $.extend(true, settings, name);
                    } else if (value !== undefined) {
                        if ($.isPlainObject(settings[name])) {
                            $.extend(true, settings[name], value);
                        } else {
                            settings[name] = value;
                        }
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
                        }, 500);
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
                        if ($allModules.length > 1) {
                            title += ' (' + $allModules.length + ')';
                        }
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

            module.preinitialize();

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

    $.fn.dimmer.settings = {

        name: 'Dimmer',
        namespace: 'dimmer',

        silent: false,
        debug: false,
        verbose: false,
        performance: true,

        // whether flex layout should be used
        useFlex: true,

        // name to distinguish between multiple dimmers in context
        dimmerName: false,

        // whether to add a variation type
        variation: false,

        // whether to bind close events
        closable: 'auto',

        // whether to use CSS animations
        useCSS: true,

        // CSS animation to use
        transition: 'fade',

        // event to bind to
        on: false,

        // overriding opacity value
        opacity: 'auto',

        // transition durations
        duration: {
            show: 500,
            hide: 500,
        },
        // whether the dynamically created dimmer should have a loader
        displayLoader: false,
        loaderText: false,
        loaderVariation: '',

        onChange: function () {},
        onShow: function () {},
        onHide: function () {},
        onVisible: function () {},
        onHidden: function () {},

        error: {
            method: 'The method you called is not defined.',
        },

        className: {
            active: 'active',
            animating: 'animating',
            dimmable: 'dimmable',
            dimmed: 'dimmed',
            dimmer: 'dimmer',
            disabled: 'disabled',
            hide: 'hide',
            legacy: 'legacy',
            pageDimmer: 'page',
            show: 'show',
            loader: 'ui loader',
        },

        selector: {
            dimmer: '> .ui.dimmer',
            content: '.ui.dimmer > .content, .ui.dimmer > .content > .center',
        },

        template: {
            dimmer: function (settings) {
                let d = $('<div/>').addClass('ui dimmer');
                let l;
                if (settings.displayLoader) {
                    l = $('<div/>')
                        .addClass(settings.className.loader)
                        .addClass(settings.loaderVariation);
                    if (settings.loaderText) {
                        l.text(settings.loaderText);
                        l.addClass('text');
                    }
                    d.append(l);
                }

                return d;
            },
        },

    };
})(jQuery, window, document);
