/*!
 * # Fomantic-UI - Embed
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

    $.fn.embed = function (parameters) {
        let $allModules = $(this);

        let time = Date.now();
        let performance = [];

        let query = arguments[0];
        let methodInvoked = typeof query === 'string';
        let queryArguments = [].slice.call(arguments, 1);

        let returnedValue;

        $allModules.each(function () {
            let settings = $.isPlainObject(parameters)
                ? $.extend(true, {}, $.fn.embed.settings, parameters)
                : $.extend({}, $.fn.embed.settings);

            let selector = settings.selector;
            let className = settings.className;
            let sources = settings.sources;
            let error = settings.error;
            let metadata = settings.metadata;
            let namespace = settings.namespace;
            let templates = settings.templates;

            let eventNamespace = '.' + namespace;
            let moduleNamespace = 'module-' + namespace;

            let $module = $(this);
            let $placeholder = $module.find(selector.placeholder);
            let $icon = $module.find(selector.icon);
            let $embed = $module.find(selector.embed);

            let element = this;
            let instance = $module.data(moduleNamespace);
            let module;

            module = {

                initialize: function () {
                    module.debug('Initializing embed');
                    module.determine.autoplay();
                    module.create();
                    module.bind.events();
                    module.instantiate();
                },

                instantiate: function () {
                    module.verbose('Storing instance of module', module);
                    instance = module;
                    $module
                        .data(moduleNamespace, module);
                },

                destroy: function () {
                    module.verbose('Destroying previous instance of embed');
                    module.reset();
                    $module
                        .removeData(moduleNamespace)
                        .off(eventNamespace);
                },

                refresh: function () {
                    module.verbose('Refreshing selector cache');
                    $placeholder = $module.find(selector.placeholder);
                    $icon = $module.find(selector.icon);
                    $embed = $module.find(selector.embed);
                },

                bind: {
                    events: function () {
                        if (module.has.placeholder()) {
                            module.debug('Adding placeholder events');
                            $module
                                .on('click' + eventNamespace, selector.placeholder, module.createAndShow)
                                .on('click' + eventNamespace, selector.icon, module.createAndShow);
                        }
                    },
                },

                create: function () {
                    let placeholder = module.get.placeholder();
                    if (placeholder) {
                        module.createPlaceholder();
                    } else {
                        module.createAndShow();
                    }
                },

                createPlaceholder: function (placeholder) {
                    let icon = module.get.icon();
                    let alt = module.get.alt();
                    placeholder = placeholder || module.get.placeholder();
                    $module.html(templates.placeholder(placeholder, icon, alt));
                    module.debug('Creating placeholder for embed', placeholder, icon, alt);
                },

                createEmbed: function (url) {
                    module.refresh();
                    url = url || module.get.url();
                    $embed = $('<div/>')
                        .addClass(className.embed)
                        .html(module.generate.embed(url))
                        .appendTo($module);
                    settings.onCreate.call(element, url);
                    module.debug('Creating embed object', $embed);
                },

                changeEmbed: function (url) {
                    $embed
                        .html(module.generate.embed(url));
                },

                createAndShow: function () {
                    module.createEmbed();
                    module.show();
                },

                // sets new embed
                change: function (source, id, url) {
                    module.debug('Changing video to ', source, id, url);
                    $module
                        .data(metadata.source, source)
                        .data(metadata.id, id);
                    if (url) {
                        $module.data(metadata.url, url);
                    } else {
                        $module.removeData(metadata.url);
                    }
                    if (module.has.embed()) {
                        module.changeEmbed();
                    } else {
                        module.create();
                    }
                },

                // clear embed
                reset: function () {
                    module.debug('Clearing embed and showing placeholder');
                    module.remove.data();
                    module.remove.active();
                    module.remove.embed();
                    module.showPlaceholder();
                    settings.onReset.call(element);
                },

                // shows current embed
                show: function () {
                    module.debug('Showing embed');
                    module.set.active();
                    settings.onDisplay.call(element);
                },

                hide: function () {
                    module.debug('Hiding embed');
                    module.showPlaceholder();
                },

                showPlaceholder: function () {
                    module.debug('Showing placeholder image');
                    module.remove.active();
                    settings.onPlaceholderDisplay.call(element);
                },

                get: {
                    id: function () {
                        return settings.id || $module.data(metadata.id);
                    },
                    placeholder: function () {
                        return settings.placeholder || $module.data(metadata.placeholder);
                    },
                    alt: function () {
                        return settings.alt || $module.data(metadata.alt);
                    },
                    icon: function () {
                        return settings.icon || ($module.data(metadata.icon) !== undefined
                            ? $module.data(metadata.icon)
                            : module.determine.icon());
                    },
                    source: function (url) {
                        return settings.source || ($module.data(metadata.source) !== undefined
                            ? $module.data(metadata.source)
                            : module.determine.source());
                    },
                    type: function () {
                        let source = module.get.source();

                        return sources[source] !== undefined
                            ? sources[source].type
                            : false;
                    },
                    url: function () {
                        return settings.url || ($module.data(metadata.url) !== undefined
                            ? $module.data(metadata.url)
                            : module.determine.url());
                    },
                },

                determine: {
                    autoplay: function () {
                        if (module.should.autoplay()) {
                            settings.autoplay = true;
                        }
                    },
                    source: function (url) {
                        let matchedSource = false;
                        url = url || module.get.url();
                        if (url) {
                            $.each(sources, function (name, source) {
                                if (url.search(source.domain) !== -1) {
                                    matchedSource = name;

                                    return false;
                                }
                            });
                        }

                        return matchedSource;
                    },
                    icon: function () {
                        let source = module.get.source();

                        return sources[source] !== undefined
                            ? sources[source].icon
                            : false;
                    },
                    url: function () {
                        let id = settings.id || $module.data(metadata.id);
                        let source = settings.source || $module.data(metadata.source);
                        let url;
                        url = sources[source] !== undefined
                            ? sources[source].url.replace('{id}', id)
                            : false;
                        if (url) {
                            $module.data(metadata.url, url);
                        }

                        return url;
                    },
                },

                set: {
                    active: function () {
                        $module.addClass(className.active);
                    },
                },

                remove: {
                    data: function () {
                        $module
                            .removeData(metadata.id)
                            .removeData(metadata.icon)
                            .removeData(metadata.placeholder)
                            .removeData(metadata.alt)
                            .removeData(metadata.source)
                            .removeData(metadata.url);
                    },
                    active: function () {
                        $module.removeClass(className.active);
                    },
                    embed: function () {
                        $embed.empty();
                    },
                },

                encode: {
                    parameters: function (parameters) {
                        let urlString = [];
                        let index;
                        for (index in parameters) {
                            urlString.push(encodeURIComponent(index) + '=' + encodeURIComponent(parameters[index]));
                        }

                        return urlString.join('&amp;');
                    },
                },

                generate: {
                    embed: function (url) {
                        module.debug('Generating embed html');
                        let source = module.get.source();
                        let html;
                        let parameters;
                        url = module.get.url(url);
                        if (url) {
                            parameters = module.generate.parameters(source);
                            html = templates.iframe(url, parameters);
                        } else {
                            module.error(error.noURL, $module);
                        }

                        return html;
                    },
                    parameters: function (source, extraParameters) {
                        let parameters = sources[source] && sources[source].parameters !== undefined
                            ? sources[source].parameters(settings)
                            : {};
                        extraParameters = extraParameters || settings.parameters;
                        if (extraParameters) {
                            parameters = $.extend({}, parameters, extraParameters);
                        }
                        parameters = settings.onEmbed(parameters);

                        return module.encode.parameters(parameters);
                    },
                },

                has: {
                    embed: function () {
                        return $embed.length > 0;
                    },
                    placeholder: function () {
                        return settings.placeholder || $module.data(metadata.placeholder);
                    },
                },

                should: {
                    autoplay: function () {
                        return settings.autoplay === 'auto'
                            ? settings.placeholder || $module.data(metadata.placeholder) !== undefined
                            : settings.autoplay;
                    },
                },

                is: {
                    video: function () {
                        return module.get.type() === 'video';
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

    $.fn.embed.settings = {

        name: 'Embed',
        namespace: 'embed',

        silent: false,
        debug: false,
        verbose: false,
        performance: true,

        icon: false,
        source: false,
        url: false,
        id: false,
        placeholder: false,
        alt: false,

        // standard video settings
        autoplay: 'auto',
        color: '#444',
        hd: true,
        brandedUI: false,

        // additional parameters to include with the embed
        parameters: false,

        onDisplay: function () {},
        onPlaceholderDisplay: function () {},
        onReset: function () {},
        onCreate: function (url) {},
        onEmbed: function (parameters) {
            return parameters;
        },

        metadata: {
            id: 'id',
            icon: 'icon',
            placeholder: 'placeholder',
            alt: 'alt',
            source: 'source',
            url: 'url',
        },

        error: {
            noURL: 'No URL specified',
            method: 'The method you called is not defined',
        },

        className: {
            active: 'active',
            embed: 'embed',
        },

        selector: {
            embed: '.embed',
            placeholder: '.placeholder',
            icon: '.icon',
        },

        sources: {
            youtube: {
                name: 'youtube',
                type: 'video',
                icon: 'video play',
                domain: 'youtube.com',
                url: '//www.youtube.com/embed/{id}',
                parameters: function (settings) {
                    return {
                        autohide: !settings.brandedUI,
                        autoplay: settings.autoplay,
                        color: settings.color || undefined,
                        hq: settings.hd,
                        jsapi: settings.api,
                        modestbranding: !settings.brandedUI,
                    };
                },
            },
            vimeo: {
                name: 'vimeo',
                type: 'video',
                icon: 'video play',
                domain: 'vimeo.com',
                url: '//player.vimeo.com/video/{id}',
                parameters: function (settings) {
                    return {
                        api: settings.api,
                        autoplay: settings.autoplay,
                        byline: settings.brandedUI,
                        color: settings.color || undefined,
                        portrait: settings.brandedUI,
                        title: settings.brandedUI,
                    };
                },
            },
        },

        templates: {
            escape: function (string) {
                const escapeMap = {
                    '"': '&quot;',
                    '&': '&amp;',
                    "'": '&apos;',
                    '<': '&lt;',
                    '>': '&gt;',
                };

                return String(string).replace(/["&'<>]/g, (chr) => escapeMap[chr]);
            },
            iframe: function (url, parameters) {
                let src = url;
                let escape = $.fn.embed.settings.templates.escape;
                if (parameters) {
                    src += '?' + parameters;
                }

                return ''
                    + '<iframe src="' + escape(src) + '"'
                    + ' width="100%" height="100%"'
                    + ' msallowFullScreen allowFullScreen></iframe>';
            },
            placeholder: function (image, icon, alt) {
                let html = '';
                let escape = $.fn.embed.settings.templates.escape;
                if (icon) {
                    html += '<i class="' + escape(icon) + ' icon"></i>';
                }
                if (image) {
                    html += '<img class="placeholder" src="' + escape(image) + '"' + (alt ? ' alt="' + escape(alt) + '"' : '') + '>';
                }

                return html;
            },
        },

        // NOT YET IMPLEMENTED
        api: false,
        onPause: function () {},
        onPlay: function () {},
        onStop: function () {},

    };
})(jQuery, window, document);
