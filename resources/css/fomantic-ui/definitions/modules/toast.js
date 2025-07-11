/*!
 * # Fomantic-UI - Toast
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

    $.fn.toast = function (parameters) {
        let $allModules = $(this);
        let $body = $('body');

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
                    $context = win.frameElement ? contextCheck(context, win.parent) : $body;
                }
            }

            return $context;
        };
        let returnedValue;
        $allModules.each(function () {
            let settings = $.isPlainObject(parameters)
                ? $.extend(true, {}, $.fn.toast.settings, parameters)
                : $.extend({}, $.fn.toast.settings);

            let className = settings.className;
            let selector = settings.selector;
            let error = settings.error;
            let namespace = settings.namespace;
            let fields = settings.fields;

            let eventNamespace = '.' + namespace;
            let moduleNamespace = namespace + '-module';

            let $module = $(this);
            let $toastBox;
            let $toast;
            let $actions;
            let $progress;
            let $progressBar;
            let $animationObject;
            let $close;
            let $context = settings.context ? contextCheck(settings.context, window) : $body;

            let isToastComponent = $module.hasClass('toast') || $module.hasClass('message') || $module.hasClass('card');

            let element = this;
            let instance = isToastComponent ? $module.data(moduleNamespace) : undefined;

            let id;
            let module;
            module = {

                initialize: function () {
                    module.verbose('Initializing element');
                    module.create.id();
                    if (!module.has.container()) {
                        module.create.container();
                    }
                    if (isToastComponent || settings.message !== '' || settings.title !== '' || module.get.iconClass() !== '' || settings.showImage || module.has.configActions()) {
                        if (typeof settings.showProgress !== 'string' || [className.top, className.bottom].indexOf(settings.showProgress) === -1) {
                            settings.showProgress = false;
                        }
                        module.create.toast();
                        if (settings.closeOnClick && (settings.closeIcon || $($toast).find(selector.input).length > 0 || module.has.configActions())) {
                            settings.closeOnClick = false;
                        }
                        if (!settings.closeOnClick) {
                            $toastBox.addClass(className.unclickable);
                        }
                        module.bind.events();
                    }
                    module.instantiate();
                    if ($toastBox) {
                        module.show();
                    }
                },

                instantiate: function () {
                    module.verbose('Storing instance of toast');
                    instance = module;
                    $module
                        .data(moduleNamespace, instance);
                },

                destroy: function () {
                    if ($toastBox) {
                        module.debug('Removing toast', $toastBox);
                        module.unbind.events();
                        settings.onRemove.call($toastBox, element);
                        $toastBox.remove();
                        $toastBox = undefined;
                        $toast = undefined;
                        $animationObject = undefined;
                        $progress = undefined;
                        $progressBar = undefined;
                        $close = undefined;
                    }
                    $module
                        .removeData(moduleNamespace);
                },

                show: function (callback) {
                    if (settings.onShow.call($toastBox, element) === false) {
                        module.debug('onShow callback returned false, cancelling toast animation');

                        return;
                    }
                    callback = callback || function () {};
                    module.debug('Showing toast');
                    module.animate.show(callback);
                },

                close: function (callback) {
                    if (settings.onHide.call($toastBox, element) === false) {
                        module.debug('onHide callback returned false, cancelling toast animation');

                        return;
                    }
                    callback = callback || function () {};
                    module.debug('Closing toast');
                    module.remove.visible();
                    module.unbind.events();
                    module.animate.close(callback);
                },

                create: {
                    container: function () {
                        module.verbose('Creating container');
                        $context.append($('<div/>', {
                            class: settings.position + ' ' + className.container + ' '
                            + (settings.horizontal ? className.horizontal : '') + ' '
                            + (settings.context && settings.context !== 'body' ? className.absolute : ''),
                        }));
                    },
                    id: function () {
                        id = (Math.random().toString(16) + '000000000').slice(2, 10);
                        module.verbose('Creating unique id for element', id);
                    },
                    toast: function () {
                        $toastBox = $('<div/>', { class: className.box });
                        let iconClass = module.get.iconClass();
                        if (!isToastComponent) {
                            module.verbose('Creating toast');
                            $toast = $('<div/>', { role: 'alert' });
                            let $content = $('<div/>', { class: className.content });
                            if (iconClass !== '') {
                                $toast.append($('<i/>', { class: iconClass + ' ' + className.icon }));
                            }

                            if (settings.showImage) {
                                $toast.append($('<img>', {
                                    class: className.image + ' ' + settings.classImage,
                                    src: settings.showImage,
                                    alt: settings.alt || '',
                                }));
                            }
                            if (settings.title !== '') {
                                let titleId = '_' + module.get.id() + 'title';
                                $toast.attr('aria-labelledby', titleId);
                                $content.append($('<div/>', {
                                    class: className.title,
                                    id: titleId,
                                    html: module.helpers.escape(settings.title, settings),
                                }));
                            }
                            let descId = '_' + module.get.id() + 'desc';
                            $toast.attr('aria-describedby', descId);
                            $content.append($('<div/>', {
                                class: className.message,
                                id: descId,
                                html: module.helpers.escape(settings.message, settings),
                            }));

                            $toast
                                .addClass(settings.class + ' ' + className.toast)
                                .append($content);
                            $toast.css('opacity', String(settings.opacity));
                            if (settings.closeIcon) {
                                $close = $('<i/>', {
                                    class: className.close + ' ' + (typeof settings.closeIcon === 'string' ? settings.closeIcon : ''),
                                    role: 'button',
                                    tabindex: 0,
                                    'aria-label': settings.text.close,
                                });
                                if ($close.hasClass(className.left)) {
                                    $toast.prepend($close);
                                } else {
                                    $toast.append($close);
                                }
                            }
                        } else {
                            $toast = settings.cloneModule ? $module.clone().removeAttr('id') : $module;
                            $close = $toast.find('> i' + module.helpers.toClass(className.close));
                            settings.closeIcon = $close.length > 0;
                            if (iconClass !== '') {
                                $toast.find(selector.icon).attr('class', iconClass + ' ' + className.icon);
                            }
                            if (settings.showImage) {
                                $toast.find(selector.image).attr('src', settings.showImage).attr('alt', settings.alt || '');
                            }
                            if (settings.title !== '') {
                                $toast.find(selector.title).html(module.helpers.escape(settings.title, settings));
                            }
                            if (settings.message !== '') {
                                $toast.find(selector.message).html(module.helpers.escape(settings.message, settings));
                            }
                        }
                        if ($toast.hasClass(className.compact)) {
                            settings.compact = true;
                        }
                        if ($toast.hasClass('card')) {
                            settings.compact = false;
                        }
                        $actions = $toast.find('.actions');
                        if (module.has.configActions()) {
                            if ($actions.length === 0) {
                                $actions = $('<div/>', { class: className.actions + ' ' + (settings.classActions || '') }).appendTo($toast);
                            }
                            if ($toast.hasClass('card') && !$actions.hasClass(className.attached)) {
                                $actions.addClass(className.extraContent);
                                if ($actions.hasClass(className.vertical)) {
                                    $actions.removeClass(className.vertical);
                                    module.error(error.verticalCard);
                                }
                            }
                            settings.actions.forEach(function (el) {
                                let icon = el[fields.icon]
                                    ? '<i ' + (el[fields.text] ? 'aria-hidden="true"' : '')
                                            + ' class="' + module.helpers.escape(el[fields.icon]) + ' icon"></i>'
                                    : '';
                                let text = module.helpers.escape(el[fields.text] || '', settings);
                                let cls = module.helpers.escape(el[fields.class] || '');
                                let click = el[fields.click] && isFunction(el[fields.click])
                                    ? el[fields.click]
                                    : function () {};
                                $actions.append($('<button/>', {
                                    html: icon + text,
                                    'aria-label': (el[fields.text] || el[fields.icon] || '').replace(/<[^>]+(>|$)/g, ''),
                                    class: className.button + ' ' + cls,
                                    on: {
                                        click: function () {
                                            let $button = $(this);
                                            if ($button.is(selector.approve) || $button.is(selector.deny) || click.call(element, $module) === false) {
                                                return;
                                            }
                                            module.close();
                                        },
                                    },
                                }));
                            });
                        }
                        if ($actions && $actions.hasClass(className.vertical)) {
                            $toast.addClass(className.vertical);
                        }
                        if ($actions.length > 0 && !$actions.hasClass(className.attached)) {
                            if ($actions && (!$actions.hasClass(className.basic) || $actions.hasClass(className.left))) {
                                $toast.addClass(className.actions);
                            }
                        }
                        if (settings.displayTime === 'auto') {
                            settings.displayTime = Math.max(settings.minDisplayTime, ($toast.text().split(' ').length / settings.wordsPerMinute) * 60000);
                        }
                        $toastBox.append($toast);

                        if ($actions.length > 0 && $actions.hasClass(className.attached)) {
                            $actions.addClass(className.buttons);
                            $actions.detach();
                            $toast.addClass(className.attached);
                            if (!$actions.hasClass(className.vertical)) {
                                if ($actions.hasClass(className.top)) {
                                    $toastBox.prepend($actions);
                                    $toast.addClass(className.bottom);
                                } else {
                                    $toastBox.append($actions);
                                    $toast.addClass(className.top);
                                }
                            } else {
                                $toast.wrap(
                                    $('<div/>', {
                                        class: className.vertical + ' '
                                            + className.attached + ' '
                                            + (settings.compact ? className.compact : ''),
                                    })
                                );
                                if ($actions.hasClass(className.left)) {
                                    $toast.addClass(className.left).parent().addClass(className.left).prepend($actions);
                                } else {
                                    $toast.parent().append($actions);
                                }
                            }
                        }
                        if ($module !== $toast) {
                            $module = $toast;
                            element = $toast[0];
                        }
                        if (settings.displayTime > 0) {
                            let progressingClass = className.progressing + ' ' + (settings.pauseOnHover ? className.pausable : '');
                            if (settings.showProgress) {
                                $progress = $('<div/>', {
                                    class: className.progress + ' ' + (settings.classProgress || settings.class),
                                    'data-percent': '',
                                });
                                if (!settings.classProgress) {
                                    if ($toast.hasClass('toast') && !$toast.hasClass(className.inverted)) {
                                        $progress.addClass(className.inverted);
                                    } else {
                                        $progress.removeClass(className.inverted);
                                    }
                                }
                                $progressBar = $('<div/>', { class: 'bar ' + (settings.progressUp ? 'up ' : 'down ') + progressingClass });
                                $progress
                                    .addClass(settings.showProgress)
                                    .append($progressBar);
                                if ($progress.hasClass(className.top)) {
                                    $toastBox.prepend($progress);
                                } else {
                                    $toastBox.append($progress);
                                }
                                $progressBar.css('animation-duration', settings.displayTime / 1000 + 's');
                            }
                            $animationObject = $('<span/>', { class: 'wait ' + progressingClass });
                            $animationObject.css('animation-duration', settings.displayTime / 1000 + 's');
                            $animationObject.appendTo($toast);
                        }
                        if (settings.compact) {
                            $toastBox.addClass(className.compact);
                            $toast.addClass(className.compact);
                            if ($progress) {
                                $progress.addClass(className.compact);
                            }
                        }
                        if (settings.newestOnTop) {
                            $toastBox.prependTo(module.get.container());
                        } else {
                            $toastBox.appendTo(module.get.container());
                        }
                    },
                },

                bind: {
                    events: function () {
                        module.debug('Binding events to toast');
                        if (settings.closeIcon) {
                            $close.on('click' + eventNamespace, module.event.close);
                        }
                        $toast.on('click' + eventNamespace, module.event.click);
                        if ($animationObject) {
                            $animationObject.on('animationend' + eventNamespace, module.event.close);
                        }
                        $toastBox
                            .on('click' + eventNamespace, selector.approve, module.event.approve)
                            .on('click' + eventNamespace, selector.deny, module.event.deny);
                    },
                },

                unbind: {
                    events: function () {
                        module.debug('Unbinding events to toast');
                        if (settings.closeIcon) {
                            $close.off('click' + eventNamespace);
                        }
                        $toast.off('click' + eventNamespace);
                        if ($animationObject) {
                            $animationObject.off('animationend' + eventNamespace);
                        }
                        $toastBox
                            .off('click' + eventNamespace);
                    },
                },

                animate: {
                    show: function (callback) {
                        callback = isFunction(callback) ? callback : function () {};
                        if (settings.transition && module.can.useElement('transition')) {
                            module.set.visible();
                            $toastBox
                                .transition({
                                    animation: settings.transition.showMethod + ' in',
                                    queue: false,
                                    debug: settings.debug,
                                    verbose: settings.verbose,
                                    silent: settings.silent,
                                    duration: settings.transition.showDuration,
                                    onComplete: function () {
                                        callback.call($toastBox, element);
                                        settings.onVisible.call($toastBox, element);
                                    },
                                });
                        }
                    },
                    close: function (callback) {
                        callback = isFunction(callback) ? callback : function () {};
                        if (settings.transition && $.fn.transition !== undefined) {
                            $toastBox
                                .transition({
                                    animation: settings.transition.hideMethod + ' out',
                                    queue: false,
                                    duration: settings.transition.hideDuration,
                                    debug: settings.debug,
                                    verbose: settings.verbose,
                                    silent: settings.silent,
                                    interval: 50,

                                    onBeforeHide: function (callback) {
                                        callback = isFunction(callback) ? callback : function () {};
                                        if (settings.transition.closeEasing !== '') {
                                            if ($toastBox) {
                                                $toastBox.css('opacity', '0');
                                                $toastBox.wrap('<div/>').parent().hide(settings.transition.closeDuration, settings.transition.closeEasing, function () {
                                                    if ($toastBox) {
                                                        $toastBox.parent().remove();
                                                        callback.call($toastBox);
                                                    }
                                                });
                                            }
                                        } else {
                                            callback.call($toastBox);
                                        }
                                    },
                                    onComplete: function () {
                                        callback.call($toastBox, element);
                                        settings.onHidden.call($toastBox, element);
                                        module.destroy();
                                    },
                                });
                        } else {
                            module.error(error.noTransition);
                        }
                    },
                    pause: function () {
                        $animationObject.css('animationPlayState', 'paused');
                        if ($progressBar) {
                            $progressBar.css('animationPlayState', 'paused');
                        }
                    },
                    continue: function () {
                        $animationObject.css('animationPlayState', 'running');
                        if ($progressBar) {
                            $progressBar.css('animationPlayState', 'running');
                        }
                    },
                },

                has: {
                    container: function () {
                        module.verbose('Determining if there is already a container');

                        return module.get.containers().length > 0;
                    },
                    toast: function () {
                        return !!module.get.toast();
                    },
                    toasts: function () {
                        return module.get.toasts().length > 0;
                    },
                    configActions: function () {
                        return Array.isArray(settings.actions) && settings.actions.length > 0;
                    },
                },

                get: {
                    id: function () {
                        return id;
                    },
                    containers: function () {
                        return $context.children(module.helpers.toClass(settings.position) + selector.container
                            + (settings.horizontal
                                ? module.helpers.toClass(className.horizontal)
                                : ':not(' + module.helpers.toClass(className.horizontal) + ')')
                            + (settings.context && settings.context !== 'body'
                                ? module.helpers.toClass(className.absolute)
                                : ':not(' + module.helpers.toClass(className.absolute) + ')'));
                    },
                    container: function () {
                        return module.get.containers()[0];
                    },
                    toastBox: function () {
                        return $toastBox || null;
                    },
                    toast: function () {
                        return $toast || null;
                    },
                    toasts: function () {
                        return $(module.get.container()).find(selector.box);
                    },
                    iconClass: function () {
                        return typeof settings.showIcon === 'string'
                            ? settings.showIcon
                            : (settings.showIcon && settings.icons[settings.class]
                                ? settings.icons[settings.class]
                                : '');
                    },
                    remainingTime: function () {
                        return $animationObject ? $animationObject.css('opacity') * settings.displayTime : 0;
                    },
                },

                set: {
                    visible: function () {
                        $toast.addClass(className.visible);
                    },
                },

                remove: {
                    visible: function () {
                        $toast.removeClass(className.visible);
                    },
                },

                event: {
                    close: function () {
                        module.close();
                    },
                    click: function (event) {
                        if ($(event.target).closest(selector.clickable).length === 0) {
                            if (settings.onClick.call($toastBox, element) === false || !settings.closeOnClick) {
                                module.verbose('Click callback returned false or close denied by setting cancelling close');

                                return;
                            }
                            module.close();
                        }
                    },
                    approve: function () {
                        if (settings.onApprove.call(element, $module) === false) {
                            module.verbose('Approve callback returned false cancelling close');

                            return;
                        }
                        module.close();
                    },
                    deny: function () {
                        if (settings.onDeny.call(element, $module) === false) {
                            module.verbose('Deny callback returned false cancelling close');

                            return;
                        }
                        module.close();
                    },
                },

                helpers: {
                    toClass: function (selector) {
                        let classes = selector.trim().split(/\s+/);
                        let result = '';

                        classes.forEach(function (element) {
                            result += '.' + element;
                        });

                        return result;
                    },
                    escape: function (string, settings) {
                        if (settings !== undefined && settings.preserveHTML) {
                            return string;
                        }

                        const escapeMap = {
                            '"': '&quot;',
                            '&': '&amp;',
                            "'": '&apos;',
                            '<': '&lt;',
                            '>': '&gt;',
                        };

                        return String(string).replace(/["&'<>]/g, (chr) => escapeMap[chr]);
                    },
                },

                can: {
                    useElement: function (element) {
                        if ($.fn[element] !== undefined) {
                            return true;
                        }
                        module.error(error.noElement.replace('{element}', element));

                        return false;
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
                returnedValue = $module;
            }
        });

        return returnedValue !== undefined
            ? returnedValue
            : this;
    };
    $.toast = $.fn.toast;

    $.fn.toast.settings = {

        name: 'Toast',
        namespace: 'toast',

        silent: false,
        debug: false,
        verbose: false,
        performance: true,

        context: 'body',

        position: 'top right',
        horizontal: false,
        class: 'neutral',
        classProgress: false,
        classActions: false,
        classImage: 'mini',

        title: '',
        message: '',
        displayTime: 3000, // set to zero to require manual dismissal, otherwise hides on its own
        minDisplayTime: 1000, // minimum display time in case displayTime is set to 'auto'
        wordsPerMinute: 120,
        showIcon: false,
        newestOnTop: false,
        showProgress: false,
        pauseOnHover: true,
        progressUp: false, // if true, the bar will start at 0% and increase to 100%
        opacity: 1,
        compact: true,
        closeIcon: false,
        closeOnClick: true,
        cloneModule: true,
        actions: false,
        preserveHTML: false,
        showImage: false,
        alt: false,

        // transition settings
        transition: {
            showMethod: 'scale',
            showDuration: 500,
            hideMethod: 'scale',
            hideDuration: 500,
            closeEasing: 'easeOutCubic', // Set to empty string to stack the closed toast area immediately (old behavior)
            closeDuration: 500,
        },

        error: {
            method: 'The method you called is not defined.',
            noElement: 'This module requires ui {element}',
            verticalCard: 'Vertical but not attached actions are not supported for card layout',
        },

        className: {
            container: 'ui toast-container',
            absolute: 'absolute',
            box: 'floating toast-box',
            progress: 'ui attached active progress',
            toast: 'ui toast',
            icon: 'centered icon',
            visible: 'visible',
            content: 'content',
            title: 'ui header',
            message: 'message',
            actions: 'actions',
            extraContent: 'extra content',
            button: 'ui button',
            buttons: 'ui buttons',
            close: 'close icon',
            image: 'ui image',
            vertical: 'vertical',
            horizontal: 'horizontal',
            attached: 'attached',
            inverted: 'inverted',
            compact: 'compact',
            pausable: 'pausable',
            progressing: 'progressing',
            top: 'top',
            bottom: 'bottom',
            left: 'left',
            basic: 'basic',
            unclickable: 'unclickable',
        },

        text: {
            close: 'Close',
        },

        icons: {
            info: 'info',
            success: 'checkmark',
            warning: 'warning',
            error: 'times',
        },

        selector: {
            container: '.ui.toast-container',
            box: '.toast-box',
            toast: '.ui.toast',
            title: '.header',
            message: '.message:not(.ui)',
            image: '> img.image, > .image > img',
            icon: '> i.icon',
            input: 'input:not([type="hidden"]), textarea, select, button, .ui.button, ui.dropdown',
            clickable: 'a, details, .ui.accordion',
            approve: '.actions .positive, .actions .approve, .actions .ok',
            deny: '.actions .negative, .actions .deny, .actions .cancel',
        },

        fields: {
            class: 'class',
            text: 'text',
            icon: 'icon',
            click: 'click',
        },

        // callbacks
        onShow: function () {},
        onVisible: function () {},
        onClick: function () {},
        onHide: function () {},
        onHidden: function () {},
        onRemove: function () {},
        onApprove: function () {},
        onDeny: function () {},
    };

    $.extend($.easing, {
        easeOutBounce: function (x) {
            let n1 = 7.5625;
            let d1 = 2.75;
            if (x < 1 / d1) {
                return n1 * x * x;
            }
            if (x < 2 / d1) {
                x -= 1.5 / d1;

                return n1 * x * x + 0.75;
            }
            if (x < 2.5 / d1) {
                x -= 2.25 / d1;

                return n1 * x * x + 0.9375;
            }
            x -= 2.625 / d1;

            return n1 * x * x + 0.984375;
        },
        easeOutCubic: function (t) {
            return --t * t * t + 1;
        },
    });
})(jQuery, window, document);
