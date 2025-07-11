/*!
 * # Fomantic-UI - Site
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

    $.fn.site = function (parameters) {
        let time = Date.now();
        let performance = [];

        let query = arguments[0];
        let methodInvoked = typeof query === 'string';
        let queryArguments = [].slice.call(arguments, 1);

        let settings = $.isPlainObject(parameters)
            ? $.extend(true, {}, $.site.settings, parameters)
            : $.extend({}, $.site.settings);

        let namespace = settings.namespace;
        let error = settings.error;

        let moduleNamespace = 'module-' + namespace;

        let $document = $(document);
        let $module = $document;
        let element = this;
        let instance = $module.data(moduleNamespace);

        let module;
        let returnedValue;
        module = {

            initialize: function () {
                module.instantiate();
            },

            instantiate: function () {
                module.verbose('Storing instance of site', module);
                instance = module;
                $module
                    .data(moduleNamespace, module);
            },

            normalize: function () {
                // keep the function for backward compatibility
                // eslint-disable-next-line no-useless-return
                return;
            },

            fix: {
                consoleClear: function () {
                    module.debug('Disabling programmatic console clearing');
                    window.console.clear = function () {};
                },
            },

            moduleExists: function (name) {
                return $.fn[name] !== undefined && $.fn[name].settings !== undefined;
            },

            enabled: {
                modules: function (modules) {
                    let enabledModules = [];
                    modules = modules || settings.modules;
                    $.each(modules, function (index, name) {
                        if (module.moduleExists(name)) {
                            enabledModules.push(name);
                        }
                    });

                    return enabledModules;
                },
            },

            disabled: {
                modules: function (modules) {
                    let disabledModules = [];
                    modules = modules || settings.modules;
                    $.each(modules, function (index, name) {
                        if (!module.moduleExists(name)) {
                            disabledModules.push(name);
                        }
                    });

                    return disabledModules;
                },
            },

            change: {
                setting: function (setting, value, modules, modifyExisting) {
                    modules = typeof modules === 'string'
                        ? (modules === 'all'
                            ? settings.modules
                            : [modules])
                        : modules || settings.modules;
                    modifyExisting = modifyExisting !== undefined
                        ? modifyExisting
                        : true;
                    $.each(modules, function (index, name) {
                        let namespace = module.moduleExists(name)
                            ? $.fn[name].settings.namespace || false
                            : true;
                        let $existingModules;
                        if (module.moduleExists(name)) {
                            module.verbose('Changing default setting', setting, value, name);
                            $.fn[name].settings[setting] = value;
                            if (modifyExisting && namespace) {
                                $existingModules = $(':data(module-' + namespace + ')');
                                if ($existingModules.length > 0) {
                                    module.verbose('Modifying existing settings', $existingModules);
                                    $existingModules[name]('setting', setting, value);
                                }
                            }
                        }
                    });
                },
                settings: function (newSettings, modules, modifyExisting) {
                    modules = typeof modules === 'string'
                        ? [modules]
                        : modules || settings.modules;
                    modifyExisting = modifyExisting !== undefined
                        ? modifyExisting
                        : true;
                    $.each(modules, function (index, name) {
                        let $existingModules;
                        if (module.moduleExists(name)) {
                            module.verbose('Changing default setting', newSettings, name);
                            $.extend(true, $.fn[name].settings, newSettings);
                            if (modifyExisting && namespace) {
                                $existingModules = $(':data(module-' + namespace + ')');
                                if ($existingModules.length > 0) {
                                    module.verbose('Modifying existing settings', $existingModules);
                                    $existingModules[name]('setting', newSettings);
                                }
                            }
                        }
                    });
                },
            },

            enable: {
                console: function () {
                    module.console(true);
                },
                debug: function (modules, modifyExisting) {
                    modules = modules || settings.modules;
                    module.debug('Enabling debug for modules', modules);
                    module.change.setting('debug', true, modules, modifyExisting);
                },
                verbose: function (modules, modifyExisting) {
                    modules = modules || settings.modules;
                    module.debug('Enabling verbose debug for modules', modules);
                    module.change.setting('verbose', true, modules, modifyExisting);
                },
            },
            disable: {
                console: function () {
                    module.console(false);
                },
                debug: function (modules, modifyExisting) {
                    modules = modules || settings.modules;
                    module.debug('Disabling debug for modules', modules);
                    module.change.setting('debug', false, modules, modifyExisting);
                },
                verbose: function (modules, modifyExisting) {
                    modules = modules || settings.modules;
                    module.debug('Disabling verbose debug for modules', modules);
                    module.change.setting('verbose', false, modules, modifyExisting);
                },
            },

            console: function (enable) {
                if (enable) {
                    if (instance.cache.console === undefined) {
                        module.error(error.console);

                        return;
                    }
                    module.debug('Restoring console function');
                    window.console = instance.cache.console;
                } else {
                    module.debug('Disabling console function');
                    instance.cache.console = window.console;
                    window.console = {
                        clear: function () {},
                        error: function () {},
                        group: function () {},
                        groupCollapsed: function () {},
                        groupEnd: function () {},
                        info: function () {},
                        log: function () {},
                        table: function () {},
                        warn: function () {},
                    };
                }
            },

            destroy: function () {
                module.verbose('Destroying previous site for', $module);
                $module
                    .removeData(moduleNamespace);
            },

            cache: {},

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
                if (settings.debug) {
                    if (settings.performance) {
                        module.performance.log(arguments);
                    } else {
                        module.debug = Function.prototype.bind.call(console.info, console, settings.name + ':');
                        module.debug.apply(console, arguments);
                    }
                }
            },
            verbose: function () {
                if (settings.verbose && settings.debug) {
                    if (settings.performance) {
                        module.performance.log(arguments);
                    } else {
                        module.verbose = Function.prototype.bind.call(console.info, console, settings.name + ':');
                        module.verbose.apply(console, arguments);
                    }
                }
            },
            error: function () {
                module.error = Function.prototype.bind.call(console.error, console, settings.name + ':');
                module.error.apply(console, arguments);
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
                            Element: element,
                            Name: message[0],
                            Arguments: [].slice.call(message, 1) || '',
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
                module.destroy();
            }
            module.initialize();
        }

        return returnedValue !== undefined
            ? returnedValue
            : this;
    };
    $.site = $.fn.site;

    $.site.settings = {

        name: 'Site',
        namespace: 'site',

        error: {
            console: 'Console cannot be restored, most likely it was overwritten outside of module',
            method: 'The method you called is not defined.',
        },

        debug: false,
        verbose: false,
        performance: true,

        modules: [
            'accordion',
            'api',
            'calendar',
            'checkbox',
            'dimmer',
            'dropdown',
            'embed',
            'flyout',
            'form',
            'modal',
            'nag',
            'popup',
            'progress',
            'rating',
            'search',
            'shape',
            'sidebar',
            'slider',
            'state',
            'sticky',
            'tab',
            'toast',
            'transition',
            'visibility',
        ],

        siteNamespace: 'site',
        namespaceStub: {
            cache: {},
            config: {},
            sections: {},
            section: {},
            utilities: {},
        },

    };

    // allows for selection of elements with data attributes
    $.extend($.expr.pseudos, {
        data: $.expr.createPseudo(function (dataName) {
            return function (elem) {
                return !!$.data(elem, dataName);
            };
        }),
    });
})(jQuery, window, document);
