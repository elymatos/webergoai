/*!
 * # Fomantic-UI - Tab
 * https://github.com/fomantic/Fomantic-UI/
 *
 *
 * Released under the MIT license
 * https://opensource.org/licenses/MIT
 *
 */

(function ($, window, document) {
    'use strict';

    function isWindow(obj) {
        return obj !== null && obj === obj.window;
    }

    function isFunction(obj) {
        return typeof obj === 'function' && typeof obj.nodeType !== 'number';
    }

    window = window !== undefined && window.Math === Math
        ? window
        : globalThis;

    $.fn.tab = function (parameters) {
        // use window context if none specified
        let $allModules = isFunction(this)
            ? $(window)
            : $(this);
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
        let initializedHistory = false;
        let returnedValue;

        $allModules.each(function () {
            let settings = $.isPlainObject(parameters)
                ? $.extend(true, {}, $.fn.tab.settings, parameters)
                : $.extend({}, $.fn.tab.settings);

            let className = settings.className;
            let metadata = settings.metadata;
            let selector = settings.selector;
            let error = settings.error;
            let regExp = settings.regExp;

            let eventNamespace = '.' + settings.namespace;
            let moduleNamespace = 'module-' + settings.namespace;

            let $module = $(this);
            let $context;
            let $tabs;

            let cache = {};
            let firstLoad = true;
            let recursionDepth = 0;
            let element = this;
            let instance = $module.data(moduleNamespace);

            let activeTabPath;
            let parameterArray;
            let module;

            let historyEvent;

            module = {

                initialize: function () {
                    module.debug('Initializing tab menu item', $module);
                    module.determineTabs();

                    module.debug('Determining tabs', settings.context, $tabs);
                    // set up automatic routing
                    if (settings.auto) {
                        module.set.auto();
                    }
                    module.bind.events();

                    if (settings.history && !initializedHistory) {
                        settings.history = module.initializeHistory();
                        initializedHistory = true;
                    }

                    let activeTab = module.determine.activeTab();
                    if (settings.autoTabActivation && instance === undefined && activeTab === null) {
                        activeTab = settings.autoTabActivation === true ? module.get.initialPath() : settings.autoTabActivation;
                        module.debug('No active tab detected, setting tab active', activeTab);
                        module.changeTab(activeTab);
                    }
                    if (activeTab !== null && settings.history && settings.historyType === 'state') {
                        let autoUpdate = $.address.autoUpdate();
                        $.address.autoUpdate(false);
                        $.address.value(activeTab);
                        $.address.autoUpdate(autoUpdate);
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
                    module.debug('Destroying tabs', $module);
                    $module
                        .removeData(moduleNamespace)
                        .off(eventNamespace);
                },

                bind: {
                    events: function () {
                        // if using $.tab don't add events
                        if (!isWindow(element)) {
                            module.debug('Attaching tab activation events to element', $module);
                            $module
                                .on('click' + eventNamespace, module.event.click);
                        }
                    },
                },

                determineTabs: function () {
                    let $reference;

                    // determine tab context
                    if (settings.context === 'parent') {
                        if ($module.closest(selector.ui).length > 0) {
                            $reference = $module.closest(selector.ui);
                            module.verbose('Using closest UI element as parent', $reference);
                        } else {
                            $reference = $module;
                        }
                        $context = $reference.parent();
                        module.verbose('Determined parent element for creating context', $context);
                    } else if (settings.context) {
                        $context = contextCheck(settings.context, window);
                        module.verbose('Using selector for tab context', settings.context, $context);
                    } else {
                        $context = $('body');
                    }
                    // find tabs
                    if (settings.childrenOnly) {
                        $tabs = $context.children(selector.tabs);
                        module.debug('Searching tab context children for tabs', $context, $tabs);
                    } else {
                        $tabs = $context.find(selector.tabs);
                        module.debug('Searching tab context for tabs', $context, $tabs);
                    }
                },

                initializeHistory: function () {
                    module.debug('Initializing page state');
                    if ($.address === undefined) {
                        module.error(error.state);

                        return false;
                    }
                    if (settings.historyType === 'state') {
                        module.debug('Using HTML5 to manage state');
                        if (settings.path !== false) {
                            $.address
                                .history(true)
                                .state(settings.path);
                            $(window).trigger('popstate');
                        } else {
                            module.error(error.path);

                            return false;
                        }
                    }
                    $.address
                        .bind('change', module.event.history.change);

                    return true;
                },

                event: {
                    click: function (event) {
                        let tabPath = $(this).data(metadata.tab);
                        if (tabPath !== undefined) {
                            if (settings.history) {
                                module.verbose('Updating page state', event);
                                $.address.value(tabPath);
                            } else {
                                module.verbose('Changing tab', event);
                                module.changeTab(tabPath);
                            }
                            event.preventDefault();
                        } else {
                            module.debug('No tab specified');
                        }
                    },
                    history: {
                        change: function (event) {
                            let tabPath = event.pathNames.join('/') || module.get.initialPath();
                            let pageTitle = settings.templates.determineTitle(tabPath) || false;
                            module.performance.display();
                            module.debug('History change event', tabPath, event);
                            historyEvent = event;
                            if (tabPath !== undefined) {
                                module.changeTab(tabPath);
                            }
                            if (pageTitle) {
                                $.address.title(pageTitle);
                            }
                        },
                    },
                },

                refresh: function () {
                    if (activeTabPath) {
                        module.debug('Refreshing tab', activeTabPath);
                        module.changeTab(activeTabPath);
                    }
                },

                cache: {

                    read: function (cacheKey) {
                        return cacheKey !== undefined
                            ? cache[cacheKey]
                            : false;
                    },
                    add: function (cacheKey, content) {
                        cacheKey = cacheKey || activeTabPath;
                        module.debug('Adding cached content for', cacheKey);
                        cache[cacheKey] = content;
                    },
                    remove: function (cacheKey) {
                        cacheKey = cacheKey || activeTabPath;
                        module.debug('Removing cached content for', cacheKey);
                        delete cache[cacheKey];
                    },
                },

                set: {
                    auto: function () {
                        let url = typeof settings.path === 'string'
                            ? settings.path.replace(/\/$/, '') + '/{$tab}'
                            : '/{$tab}';
                        module.verbose('Setting up automatic tab retrieval from server', url);
                        if ($.isPlainObject(settings.apiSettings)) {
                            settings.apiSettings.url = url;
                        } else {
                            settings.apiSettings = {
                                url: url,
                            };
                        }
                    },
                    loading: function (tabPath) {
                        let $tab = module.get.tabElement(tabPath);
                        let isLoading = $tab.hasClass(className.loading);
                        if (!isLoading) {
                            module.verbose('Setting loading state for', $tab);
                            $tab
                                .addClass(className.loading)
                                .siblings($tabs)
                                .removeClass(className.active + ' ' + className.loading);
                            if ($tab.length > 0) {
                                settings.onRequest.call($tab[0], tabPath);
                            }
                        }
                    },
                    state: function (state) {
                        $.address.value(state);
                    },
                },

                changeTab: function (tabPath) {
                    let pushStateAvailable = window.history && window.history.pushState;
                    let shouldIgnoreLoad = pushStateAvailable && settings.ignoreFirstLoad && firstLoad;
                    let remoteContent = settings.auto || $.isPlainObject(settings.apiSettings);
                    // only add the default path if not remote content
                    let pathArray = remoteContent && !shouldIgnoreLoad
                        ? module.utilities.pathToArray(tabPath)
                        : module.get.defaultPathArray(tabPath);
                    tabPath = module.utilities.arrayToPath(pathArray);
                    $.each(pathArray, function (index, tab) {
                        let currentPathArray = pathArray.slice(0, index + 1);
                        let currentPath = module.utilities.arrayToPath(currentPathArray);

                        let isTab = module.is.tab(currentPath);
                        let isLastIndex = index + 1 === pathArray.length;

                        let $tab = module.get.tabElement(currentPath);
                        let $anchor;
                        let nextPathArray;
                        let nextPath;
                        let isLastTab;
                        module.verbose('Looking for tab', tab);
                        if (isTab) {
                            module.verbose('Tab was found', tab);
                            // scope up
                            activeTabPath = currentPath;
                            parameterArray = module.utilities.filterArray(pathArray, currentPathArray);

                            if (isLastIndex) {
                                isLastTab = true;
                            } else {
                                nextPathArray = pathArray.slice(0, index + 2);
                                nextPath = module.utilities.arrayToPath(nextPathArray);
                                isLastTab = !module.is.tab(nextPath);
                                if (isLastTab) {
                                    module.verbose('Tab parameters found', nextPathArray);
                                }
                            }
                            if (settings.onBeforeChange.call(element, currentPath) === false) {
                                module.debug('onBeforeChange returned false, cancelling tab change', $tab);

                                return false;
                            }
                            if (isLastTab && remoteContent) {
                                if (!shouldIgnoreLoad) {
                                    module.activate.navigation(currentPath);
                                    module.fetch.content(currentPath, tabPath);
                                } else {
                                    module.debug('Ignoring remote content on first tab load', currentPath);
                                    firstLoad = false;
                                    module.cache.add(tabPath, $tab.html());
                                    module.activate.all(currentPath);
                                    settings.onFirstLoad.call($tab[0], currentPath, parameterArray, historyEvent);
                                    settings.onLoad.call($tab[0], currentPath, parameterArray, historyEvent);
                                }

                                return false;
                            }

                            module.debug('Opened local tab', currentPath);
                            module.activate.all(currentPath);
                            if (!module.cache.read(currentPath)) {
                                module.cache.add(currentPath, true);
                                module.debug('First time tab loaded calling tab init');
                                settings.onFirstLoad.call($tab[0], currentPath, parameterArray, historyEvent);
                            }
                            settings.onLoad.call($tab[0], currentPath, parameterArray, historyEvent);
                        } else if (tabPath.search('/') === -1 && tabPath !== '') {
                            // look for in page anchor
                            $anchor = $('#' + CSS.escape(tabPath) + ', a[name="' + CSS.escape(tabPath) + '"]');
                            currentPath = $anchor.closest('[data-tab]').data(metadata.tab);
                            $tab = module.get.tabElement(currentPath);
                            // if anchor exists, use parent tab
                            if ($anchor && $anchor.length > 0 && currentPath) {
                                module.debug('Anchor link used, opening parent tab', $tab, $anchor);
                                if (settings.onBeforeChange.call(element, currentPath) === false) {
                                    module.debug('onBeforeChange returned false, cancelling tab change', $tab);

                                    return false;
                                }
                                if (!$tab.hasClass(className.active)) {
                                    setTimeout(function () {
                                        module.scrollTo($anchor);
                                    }, 0);
                                }
                                module.activate.all(currentPath);
                                if (!module.cache.read(currentPath)) {
                                    module.cache.add(currentPath, true);
                                    module.debug('First time tab loaded calling tab init');
                                    settings.onFirstLoad.call($tab[0], currentPath, parameterArray, historyEvent);
                                }
                                settings.onLoad.call($tab[0], currentPath, parameterArray, historyEvent);

                                return false;
                            }
                        } else {
                            module.error(error.missingTab, $module, $context, currentPath);

                            return false;
                        }
                    });
                },

                scrollTo: function ($element) {
                    let scrollOffset = $element && $element.length > 0
                        ? $element.offset().top
                        : false;
                    if (scrollOffset !== false) {
                        module.debug('Forcing scroll to an in-page link in a hidden tab', scrollOffset, $element);
                        $document.scrollTop(scrollOffset);
                    }
                },

                update: {
                    content: function (tabPath, html, evaluateScripts) {
                        let $tab = module.get.tabElement(tabPath);
                        let tab = $tab[0];
                        evaluateScripts = evaluateScripts !== undefined
                            ? evaluateScripts
                            : settings.evaluateScripts;
                        if (typeof settings.cacheType === 'string' && settings.cacheType.toLowerCase() === 'dom' && typeof html !== 'string') {
                            $tab
                                .empty()
                                .append($(html).clone(true));
                        } else {
                            if (evaluateScripts) {
                                module.debug('Updating HTML and evaluating inline scripts', tabPath, html);
                                $tab.html(html);
                            } else {
                                module.debug('Updating HTML', tabPath, html);
                                tab.innerHTML = html;
                            }
                        }
                    },
                },

                fetch: {

                    content: function (tabPath, fullTabPath) {
                        let $tab = module.get.tabElement(tabPath);
                        let apiSettings = {
                            dataType: 'html',
                            encodeParameters: false,
                            on: 'now',
                            cache: settings.alwaysRefresh,
                            onSuccess: function (response) {
                                if (settings.cacheType === 'response') {
                                    module.cache.add(fullTabPath, response);
                                }
                                module.update.content(tabPath, response);
                                if (tabPath == activeTabPath) {
                                    module.debug('Content loaded', tabPath);
                                    module.activate.tab(tabPath);
                                } else {
                                    module.debug('Content loaded in background', tabPath);
                                }
                                settings.onFirstLoad.call($tab[0], tabPath, parameterArray, historyEvent);
                                settings.onLoad.call($tab[0], tabPath, parameterArray, historyEvent);

                                if (settings.loadOnce) {
                                    module.cache.add(fullTabPath, true);
                                } else if (typeof settings.cacheType === 'string' && settings.cacheType.toLowerCase() === 'dom' && $tab.children().length > 0) {
                                    setTimeout(function () {
                                        let $clone = $tab.children().clone(true);
                                        $clone = $clone.not('script');
                                        module.cache.add(fullTabPath, $clone);
                                    }, 0);
                                } else {
                                    module.cache.add(fullTabPath, $tab.html());
                                }
                            },
                            urlData: {
                                tab: fullTabPath,
                            },
                        };
                        let request = $tab.api('get request') || false;
                        let existingRequest = request && request.state() === 'pending';
                        let requestSettings;
                        let cachedContent;

                        fullTabPath = fullTabPath || tabPath;
                        cachedContent = module.cache.read(fullTabPath);

                        if (settings.cache && cachedContent) {
                            module.activate.tab(tabPath);
                            module.debug('Adding cached content', fullTabPath);
                            if (!settings.loadOnce) {
                                if (settings.evaluateScripts === 'once') {
                                    module.update.content(tabPath, cachedContent, false);
                                } else {
                                    module.update.content(tabPath, cachedContent);
                                }
                            }
                            settings.onLoad.call($tab[0], tabPath, parameterArray, historyEvent);
                        } else if (existingRequest) {
                            module.set.loading(tabPath);
                            module.debug('Content is already loading', fullTabPath);
                        } else if ($.api !== undefined) {
                            requestSettings = $.extend(true, {}, settings.apiSettings, apiSettings);
                            module.debug('Retrieving remote content', fullTabPath, requestSettings);
                            module.set.loading(tabPath);
                            $tab.api(requestSettings);
                        } else {
                            module.error(error.api);
                        }
                    },
                },

                activate: {
                    all: function (tabPath) {
                        module.activate.tab(tabPath);
                        module.activate.navigation(tabPath);
                    },
                    tab: function (tabPath) {
                        let $tab = module.get.tabElement(tabPath);
                        let $deactiveTabs = settings.deactivate === 'siblings'
                            ? $tab.siblings($tabs)
                            : $tabs.not($tab);
                        let isActive = $tab.hasClass(className.active);
                        module.verbose('Showing tab content for', $tab);
                        if (!isActive) {
                            $tab
                                .addClass(className.active);
                            $deactiveTabs
                                .removeClass(className.active + ' ' + className.loading);
                            if ($tab.length > 0) {
                                settings.onVisible.call($tab[0], tabPath);
                            }
                        }
                    },
                    navigation: function (tabPath) {
                        let $navigation = module.get.navElement(tabPath);
                        let $deactiveNavigation = settings.deactivate === 'siblings'
                            ? $navigation.siblings($allModules)
                            : $allModules.not($navigation);
                        let isActive = $navigation.hasClass(className.active);
                        module.verbose('Activating tab navigation for', $navigation, tabPath);
                        if (!isActive) {
                            $navigation
                                .addClass(className.active);
                            $deactiveNavigation
                                .removeClass(className.active + ' ' + className.loading);
                        }
                    },
                },

                deactivate: {
                    all: function () {
                        module.deactivate.navigation();
                        module.deactivate.tabs();
                    },
                    navigation: function () {
                        $allModules
                            .removeClass(className.active);
                    },
                    tabs: function () {
                        $tabs
                            .removeClass(className.active + ' ' + className.loading);
                    },
                },

                is: {
                    tab: function (tabName) {
                        return tabName !== undefined
                            ? module.get.tabElement(tabName).length > 0
                            : false;
                    },
                },

                get: {
                    initialPath: function () {
                        return $allModules.eq(0).data(metadata.tab) || $tabs.eq(0).data(metadata.tab);
                    },
                    path: function () {
                        return $.address.value();
                    },
                    // adds default tabs to the tab path
                    defaultPathArray: function (tabPath) {
                        return module.utilities.pathToArray(module.get.defaultPath(tabPath));
                    },
                    defaultPath: function (tabPath) {
                        let $defaultNav = $allModules.filter('[data-' + metadata.tab + '^="' + CSS.escape(tabPath) + '/"]').eq(0);
                        let defaultTab = $defaultNav.data(metadata.tab) || false;
                        if (defaultTab) {
                            module.debug('Found default tab', defaultTab);
                            if (recursionDepth < settings.maxDepth) {
                                recursionDepth++;

                                return module.get.defaultPath(defaultTab);
                            }
                            module.error(error.recursion);
                        } else {
                            module.debug('No default tabs found for', tabPath, $tabs);
                        }
                        recursionDepth = 0;

                        return tabPath;
                    },
                    navElement: function (tabPath) {
                        tabPath = tabPath || activeTabPath;

                        return $allModules.filter('[data-' + metadata.tab + '="' + CSS.escape(tabPath) + '"]');
                    },
                    tabElement: function (tabPath) {
                        let $fullPathTab;
                        let $simplePathTab;
                        let tabPathArray;
                        let lastTab;
                        tabPath = tabPath || activeTabPath;
                        tabPathArray = module.utilities.pathToArray(tabPath);
                        lastTab = module.utilities.last(tabPathArray);
                        $fullPathTab = $tabs.filter('[data-' + metadata.tab + '="' + CSS.escape(tabPath) + '"]');
                        $simplePathTab = $tabs.filter('[data-' + metadata.tab + '="' + CSS.escape(lastTab) + '"]');

                        return $fullPathTab.length > 0
                            ? $fullPathTab
                            : $simplePathTab;
                    },
                    tab: function () {
                        return activeTabPath;
                    },
                },

                determine: {
                    activeTab: function () {
                        let activeTab = null;

                        $tabs.each(function (_index, tab) {
                            let $tab = $(tab);

                            if ($tab.hasClass(className.active)) {
                                let tabPath = $(this).data(metadata.tab);
                                let $anchor = $allModules.filter('[data-' + metadata.tab + '="' + CSS.escape(tabPath) + '"]');

                                if ($anchor.hasClass(className.active)) {
                                    activeTab = tabPath;
                                }
                            }
                        });

                        return activeTab;
                    },
                },

                utilities: {
                    filterArray: function (keepArray, removeArray) {
                        return $.grep(keepArray, function (keepValue) {
                            return $.inArray(keepValue, removeArray) === -1;
                        });
                    },
                    last: function (array) {
                        return Array.isArray(array)
                            ? array[array.length - 1]
                            : false;
                    },
                    pathToArray: function (pathName) {
                        if (pathName === undefined) {
                            pathName = activeTabPath;
                        }

                        return typeof pathName === 'string'
                            ? pathName.split('/')
                            : [pathName];
                    },
                    arrayToPath: function (pathArray) {
                        return Array.isArray(pathArray)
                            ? pathArray.join('/')
                            : false;
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
            }
        });

        return returnedValue !== undefined
            ? returnedValue
            : this;
    };

    // shortcut for tabbed content with no defined navigation
    $.tab = function () {
        $(window).tab.apply(this, arguments);
    };

    $.fn.tab.settings = {

        name: 'Tab',
        namespace: 'tab',

        silent: false,
        debug: false,
        verbose: false,
        performance: true,

        auto: false, // uses pjax style endpoints fetching content from the same url with remote-content headers
        history: false, // use browser history
        historyType: 'hash', // #/ or html5 state
        path: false, // base path of url

        context: false, // specify a context that tabs must appear inside
        childrenOnly: false, // use only tabs that are children of context
        maxDepth: 25, // max depth a tab can be nested

        deactivate: 'siblings', // whether tabs should deactivate sibling menu elements or all elements initialized together

        alwaysRefresh: false, // load tab content new every tab click
        cache: true, // cache the content requests to pull locally
        loadOnce: false, // Whether tab data should only be loaded once when using remote content
        cacheType: 'response', // Whether to cache exact response, or to HTML cache contents after scripts execute
        ignoreFirstLoad: false, // don't load remote content on the first load

        apiSettings: false, // settings for api call
        evaluateScripts: 'once', // whether inline scripts should be parsed (true/false/once). Once will not re-evaluate on cached content
        autoTabActivation: true, // whether a non-existing active tab will auto activate the first available tab

        onFirstLoad: function (tabPath, parameterArray, historyEvent) {}, // called first time loaded
        onLoad: function (tabPath, parameterArray, historyEvent) {}, // called on every load
        onVisible: function (tabPath, parameterArray, historyEvent) {}, // called every time tab visible
        onRequest: function (tabPath, parameterArray, historyEvent) {}, // called every time a tab beings loading remote content
        onBeforeChange: function (tabPath) {}, // called before a tab is about to be changed. Returning false will cancel the tab change

        templates: {
            determineTitle: function (tabArray) {}, // returns page title for the path
        },

        error: {
            api: 'You attempted to load content without API module',
            method: 'The method you called is not defined',
            missingTab: 'Activated tab cannot be found. Tabs are case-sensitive.',
            noContent: 'The tab you specified is missing a content url.',
            path: 'History enabled, but no path was specified',
            recursion: 'Max recursive depth reached',
            state: 'History requires Asual\'s Address library <https://github.com/asual/jquery-address>',
        },

        regExp: {
            escape: /[\s#$()*+,.:=?@[\\\]^{|}-]/g,
        },

        metadata: {
            tab: 'tab',
            loaded: 'loaded',
            promise: 'promise',
        },

        className: {
            loading: 'loading',
            active: 'active',
        },

        selector: {
            tabs: '.ui.tab',
            ui: '.ui',
        },

    };
})(jQuery, window, document);
