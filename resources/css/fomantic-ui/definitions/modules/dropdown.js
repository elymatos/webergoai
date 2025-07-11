/*!
 * # Fomantic-UI - Dropdown
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

    $.fn.dropdown = function (parameters) {
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

        $allModules.each(function (elementIndex) {
            let settings = $.isPlainObject(parameters)
                ? $.extend(true, {}, $.fn.dropdown.settings, parameters)
                : $.extend({}, $.fn.dropdown.settings);

            let className = settings.className;
            let message = settings.message;
            let fields = settings.fields;
            let keys = settings.keys;
            let metadata = settings.metadata;
            let namespace = settings.namespace;
            let regExp = settings.regExp;
            let selector = settings.selector;
            let error = settings.error;
            let templates = settings.templates;

            let eventNamespace = '.' + namespace;
            let moduleNamespace = 'module-' + namespace;

            let $module = $(this);
            let $context = contextCheck(settings.context, window);
            let $text = $module.find(selector.text);
            let $search = $module.find(selector.search);
            let $sizer = $module.find(selector.sizer);
            let $input = $module.find(selector.input);
            let $icon = $module.find(selector.icon);
            let $clear = $module.find(selector.clearIcon);

            let $combo = $module.prev().find(selector.text).length > 0
                ? $module.prev().find(selector.text)
                : $module.prev();

            let $menu = $module.children(selector.menu);
            let $item = $menu.find(selector.item);
            let $divider = settings.hideDividers
                ? $item.parent().children(selector.divider)
                : $();

            let activated = false;
            let itemActivated = false;
            let internalChange = false;
            let iconClicked = false;
            let element = this;
            let focused = false;
            let instance = $module.data(moduleNamespace);

            let selectActionActive;
            let initialLoad;
            let pageLostFocus;
            let willRefocus;
            let elementNamespace;
            let id;
            let selectObserver;
            let menuObserver;
            let classObserver;
            let module;
            let tempDisableApiCache = false;

            module = {

                initialize: function () {
                    module.debug('Initializing dropdown', settings);

                    if (module.is.alreadySetup()) {
                        module.setup.reference();
                    } else {
                        module.create.id();
                        module.setup.layout();

                        if (settings.values) {
                            module.set.initialLoad();
                            module.change.values(settings.values);
                            module.remove.initialLoad();
                        }
                        if (module.get.placeholderText() !== '') {
                            module.set.placeholderText();
                        }

                        module.refreshData();

                        module.save.defaults();
                        module.restore.selected();

                        module.bind.events();

                        module.observeChanges();
                        module.instantiate();
                    }
                },

                instantiate: function () {
                    module.verbose('Storing instance of dropdown', module);
                    instance = module;
                    $module
                        .data(moduleNamespace, module);
                },

                destroy: function () {
                    module.verbose('Destroying previous dropdown', $module);
                    module.remove.tabbable();
                    module.remove.active();
                    $menu.transition('stop all');
                    $menu.removeClass(className.visible).addClass(className.hidden);
                    $module
                        .off(eventNamespace)
                        .removeData(moduleNamespace);
                    $menu
                        .off(eventNamespace);
                    $document
                        .off(elementNamespace);
                    module.disconnect.menuObserver();
                    module.disconnect.selectObserver();
                    module.disconnect.classObserver();
                },

                observeChanges: function () {
                    selectObserver = new MutationObserver(module.event.select.mutation);
                    menuObserver = new MutationObserver(module.event.menu.mutation);
                    classObserver = new MutationObserver(module.event.class.mutation);
                    module.debug('Setting up mutation observer', selectObserver, menuObserver, classObserver);
                    module.observe.select();
                    module.observe.menu();
                    module.observe.class();
                },

                disconnect: {
                    menuObserver: function () {
                        if (menuObserver) {
                            menuObserver.disconnect();
                        }
                    },
                    selectObserver: function () {
                        if (selectObserver) {
                            selectObserver.disconnect();
                        }
                    },
                    classObserver: function () {
                        if (classObserver) {
                            classObserver.disconnect();
                        }
                    },
                },
                observe: {
                    select: function () {
                        if (module.has.input() && selectObserver) {
                            selectObserver.observe($module[0], {
                                attributes: true,
                                childList: true,
                                subtree: true,
                            });
                        }
                    },
                    menu: function () {
                        if (module.has.menu() && menuObserver) {
                            menuObserver.observe($menu[0], {
                                childList: true,
                                subtree: true,
                            });
                        }
                    },
                    class: function () {
                        if (module.has.search() && classObserver) {
                            classObserver.observe($module[0], {
                                attributes: true,
                            });
                        }
                    },
                },

                create: {
                    id: function () {
                        id = (Math.random().toString(16) + '000000000').slice(2, 10);
                        elementNamespace = '.' + id;
                        module.verbose('Creating unique id for element', id);
                    },
                    userChoice: function (values) {
                        let $userChoices;
                        let $userChoice;
                        let html;
                        values = values || module.get.userValues();
                        if (!values) {
                            return false;
                        }
                        values = Array.isArray(values)
                            ? values
                            : [values];
                        $.each(values, function (index, value) {
                            if (module.get.item(value) === false) {
                                html = settings.templates.addition(module.add.variables(message.addResult, settings.templates.escape(value, settings)));
                                $userChoice = $('<div />')
                                    .html(html)
                                    .attr('data-' + metadata.value, value)
                                    .attr('data-' + metadata.text, value)
                                    .addClass(className.addition)
                                    .addClass(className.item);
                                if (settings.hideAdditions) {
                                    $userChoice.addClass(className.hidden);
                                }
                                $userChoices = $userChoices === undefined
                                    ? $userChoice
                                    : $userChoices.add($userChoice);
                                module.verbose('Creating user choices for value', value, $userChoice);
                            }
                        });

                        return $userChoices;
                    },
                    userLabels: function (value) {
                        let userValues = module.get.userValues();
                        if (userValues) {
                            module.debug('Adding user labels', userValues);
                            $.each(userValues, function (index, value) {
                                module.verbose('Adding custom user value');
                                module.add.label(value, value);
                            });
                        }
                    },
                    menu: function () {
                        $menu = $('<div />')
                            .addClass(className.menu)
                            .appendTo($module);
                    },
                    sizer: function () {
                        $sizer = $('<span />')
                            .addClass(className.sizer)
                            .insertAfter($search);
                    },
                },

                search: function (query) {
                    query = query !== undefined
                        ? query
                        : module.get.query();
                    module.verbose('Searching for query', query);
                    if (settings.fireOnInit === false && module.is.initialLoad()) {
                        module.verbose('Skipping callback on initial load', settings.onSearch);
                    } else if (module.has.minCharacters(query) && settings.onSearch.call(element, query) !== false) {
                        module.filter(query);
                    } else {
                        module.hide(null, true);
                    }
                },

                select: {
                    firstUnfiltered: function () {
                        module.verbose('Selecting first non-filtered element');
                        module.remove.selectedItem();
                        $item
                            .not(selector.unselectable)
                            .not(selector.addition + selector.hidden)
                            .eq(0)
                            .addClass(className.selected);
                    },
                    nextAvailable: function ($selected) {
                        $selected = $selected.eq(0);
                        let $nextAvailable = $selected.nextAll(selector.item).not(selector.unselectable).eq(0);
                        let $prevAvailable = $selected.prevAll(selector.item).not(selector.unselectable).eq(0);
                        let hasNext = $nextAvailable.length > 0;
                        if (hasNext) {
                            module.verbose('Moving selection to', $nextAvailable);
                            $nextAvailable.addClass(className.selected);
                        } else {
                            module.verbose('Moving selection to', $prevAvailable);
                            $prevAvailable.addClass(className.selected);
                        }
                    },
                },

                setup: {
                    api: function () {
                        let apiSettings = {
                            debug: settings.debug,
                            urlData: {
                                value: module.get.value(),
                                query: module.get.query(),
                            },
                            on: false,
                        };
                        module.verbose('First request, initializing API');
                        $module
                            .api(apiSettings);
                    },
                    layout: function () {
                        if ($module.is('select')) {
                            module.setup.select();
                            module.setup.returnedObject();
                        }
                        if (!module.has.menu()) {
                            module.create.menu();
                        }
                        if (module.is.clearable() && !module.has.clearItem()) {
                            module.verbose('Adding clear icon');
                            $clear = $('<i />')
                                .addClass('remove icon')
                                .insertAfter($icon);
                        }
                        if (module.is.search() && !module.has.search()) {
                            module.verbose('Adding search input');
                            let labelNode = $module.prev('label');
                            $search = $('<input />')
                                .addClass(className.search)
                                .prop('autocomplete', module.is.chrome() ? 'fomantic-search' : 'off');
                            if (labelNode.length > 0) {
                                if (!labelNode.attr('id')) {
                                    labelNode.attr('id', '_' + module.get.id() + '_formLabel');
                                }
                                $search.attr('aria-labelledby', labelNode.attr('id'));
                            }
                            $search.insertBefore($text);
                        }
                        if (module.is.multiple() && module.is.searchSelection() && !module.has.sizer()) {
                            module.create.sizer();
                        }
                        if (settings.allowTab) {
                            module.set.tabbable();
                        }
                    },
                    select: function () {
                        let selectValues = module.get.selectValues();
                        module.debug('Dropdown initialized on a select', selectValues);
                        if ($module.is('select')) {
                            $input = $module;
                        }
                        // see if select is placed correctly already
                        if ($input.parent(selector.dropdown).length > 0) {
                            module.debug('UI dropdown already exists. Creating dropdown menu only');
                            $module = $input.closest(selector.dropdown);
                            if (!module.has.menu()) {
                                module.create.menu();
                            }
                            $menu = $module.children(selector.menu);
                            module.setup.menu(selectValues);
                        } else {
                            module.debug('Creating entire dropdown from select');
                            $module = $('<div />')
                                .attr('class', $input.attr('class'))
                                .addClass(className.selection)
                                .addClass(className.dropdown)
                                .html(templates.dropdown(selectValues, settings))
                                .insertBefore($input);
                            if ($input.hasClass(className.multiple) && $input.prop('multiple') === false) {
                                module.error(error.missingMultiple);
                                $input.prop('multiple', true);
                            }
                            if ($input.is('[multiple]')) {
                                module.set.multiple();
                            }
                            if ($input.prop('disabled')) {
                                module.debug('Disabling dropdown');
                                $module.addClass(className.disabled);
                            }
                            if ($input.is('[required]')) {
                                settings.forceSelection = true;
                            }
                            if (!settings.allowTab) {
                                $input.removeAttr('tabindex');
                            }
                            $input
                                .prop('required', false)
                                .removeAttr('class')
                                .detach()
                                .prependTo($module);
                        }
                        module.refresh();
                    },
                    menu: function (values) {
                        $menu.html(templates.menu(values, settings));
                        $item = $menu.find(selector.item);
                        $divider = settings.hideDividers ? $item.parent().children(selector.divider) : $();
                    },
                    reference: function () {
                        module.debug('Dropdown behavior was called on select, replacing with closest dropdown');
                        // replace module reference
                        $module = $module.parent(selector.dropdown);
                        instance = $module.data(moduleNamespace);
                        element = $module[0];
                        module.refresh();
                        module.setup.returnedObject();
                    },
                    returnedObject: function () {
                        let $firstModules = $allModules.slice(0, elementIndex);
                        let $lastModules = $allModules.slice(elementIndex + 1);
                        // adjust all modules to use the correct reference
                        $allModules = $firstModules.add($module).add($lastModules);
                    },
                },

                refresh: function () {
                    module.refreshSelectors();
                    module.refreshData();
                },

                refreshItems: function () {
                    $item = $menu.find(selector.item);
                    $divider = settings.hideDividers ? $item.parent().children(selector.divider) : $();
                },

                refreshSelectors: function () {
                    module.verbose('Refreshing selector cache');
                    $text = $module.find(selector.text);
                    $search = $module.find(selector.search);
                    $input = $module.find(selector.input);
                    $icon = $module.find(selector.icon);
                    $combo = $module.prev().find(selector.text).length > 0
                        ? $module.prev().find(selector.text)
                        : $module.prev();
                    $menu = $module.children(selector.menu);
                    $item = $menu.find(selector.item);
                    $divider = settings.hideDividers ? $item.parent().children(selector.divider) : $();
                },

                refreshData: function () {
                    module.verbose('Refreshing cached metadata');
                    $item
                        .removeData(metadata.text)
                        .removeData(metadata.value);
                },

                clearData: function () {
                    module.verbose('Clearing metadata');
                    $item
                        .removeData(metadata.text)
                        .removeData(metadata.value);
                    $module
                        .removeData(metadata.defaultText)
                        .removeData(metadata.defaultValue)
                        .removeData(metadata.placeholderText);
                },

                clearItems: function () {
                    $menu.empty();
                    module.refreshItems();
                },

                toggle: function () {
                    module.verbose('Toggling menu visibility');
                    if (!module.is.active()) {
                        module.show();
                    } else {
                        module.hide();
                    }
                },

                show: function (callback, preventFocus) {
                    callback = isFunction(callback)
                        ? callback
                        : function () {};
                    if ((focused || iconClicked) && module.is.remote() && module.is.noApiCache() && !module.has.maxSelections()) {
                        module.clearItems();
                    }
                    if (!module.can.show() && module.is.remote()) {
                        module.debug('No API results retrieved, searching before show');
                        module.queryRemote(module.get.query(), module.show, [callback, preventFocus]);
                    }
                    if (module.can.show() && !module.is.active()) {
                        module.debug('Showing dropdown');
                        if (module.has.message() && !(module.has.maxSelections() || module.has.allResultsFiltered())) {
                            module.remove.message();
                        }
                        if (module.is.allFiltered()) {
                            return true;
                        }
                        if (settings.onShow.call(element) !== false) {
                            module.remove.empty();
                            module.animate.show(function () {
                                module.bind.intent();
                                if (module.has.search() && !preventFocus) {
                                    module.focusSearch();
                                }
                                module.set.visible();
                                callback.call(element);
                            });
                        }
                    }
                },

                hide: function (callback, preventBlur) {
                    callback = isFunction(callback)
                        ? callback
                        : function () {};
                    if (module.is.active() && !module.is.animatingOutward()) {
                        module.debug('Hiding dropdown');
                        if (settings.onHide.call(element) !== false) {
                            module.animate.hide(function () {
                                module.remove.visible();
                                // hiding search focus
                                if (module.is.focusedOnSearch() && preventBlur !== true) {
                                    $search.trigger('blur');
                                }
                                callback.call(element);
                            });
                            // Hide submenus explicitly. On some browsers (esp. mobile), they will not automatically receive a
                            // mouseleave event
                            let $subMenu = $module.find(selector.menu);
                            if ($subMenu.length > 0) {
                                module.verbose('Hiding sub-menu', $subMenu);
                                $subMenu.each(function () {
                                    let $sub = $(this);
                                    if (!module.is.animating($sub)) {
                                        module.animate.hide(false, $sub);
                                    }
                                });
                            }
                        }
                    } else {
                        module.unbind.intent();
                    }
                    iconClicked = false;
                    focused = false;
                },

                hideOthers: function () {
                    module.verbose('Finding other dropdowns to hide');
                    $allModules
                        .not($module)
                        .has(selector.menu + '.' + className.visible)
                        .dropdown('hide');
                },

                hideMenu: function () {
                    module.verbose('Hiding menu  instantaneously');
                    module.remove.active();
                    module.remove.visible();
                    $menu.transition('destroy').transition('hide');
                },

                hideSubMenus: function () {
                    let $subMenus = $menu.children(selector.item).find(selector.menu);
                    module.verbose('Hiding sub menus', $subMenus);
                    $subMenus.transition('hide');
                },

                bind: {
                    events: function () {
                        module.bind.keyboardEvents();
                        module.bind.inputEvents();
                        module.bind.mouseEvents();
                    },
                    keyboardEvents: function () {
                        module.verbose('Binding keyboard events');
                        $module
                            .on('keydown' + eventNamespace, module.event.keydown);
                        if (module.has.search()) {
                            $module
                                .on(module.get.inputEvent() + eventNamespace, selector.search, module.event.input);
                        }
                        if (module.is.multiple()) {
                            $document
                                .on('keydown' + elementNamespace, module.event.document.keydown);
                        }
                    },
                    inputEvents: function () {
                        module.verbose('Binding input change events');
                        $module
                            .on('change' + eventNamespace, selector.input, module.event.change);
                        if (module.is.multiple() && module.is.searchSelection()) {
                            $module
                                .on('paste' + eventNamespace, selector.search, module.event.paste);
                        }
                    },
                    mouseEvents: function () {
                        module.verbose('Binding mouse events');
                        if (module.is.multiple()) {
                            $module
                                .on('click' + eventNamespace, selector.label, module.event.label.click)
                                .on('click' + eventNamespace, selector.remove, module.event.remove.click);
                        }
                        if (module.is.searchSelection()) {
                            $module
                                .on('mousedown' + eventNamespace, module.event.mousedown)
                                .on('mouseup' + eventNamespace, module.event.mouseup)
                                .on('mousedown' + eventNamespace, selector.menu, module.event.menu.mousedown)
                                .on('mouseup' + eventNamespace, selector.menu, module.event.menu.mouseup)
                                .on('click' + eventNamespace, selector.icon, module.event.icon.click)
                                .on('click' + eventNamespace, selector.clearIcon, module.event.clearIcon.click)
                                .on('focus' + eventNamespace, selector.search, module.event.search.focus)
                                .on('click' + eventNamespace, selector.search, module.event.search.focus)
                                .on('blur' + eventNamespace, selector.search, module.event.search.blur)
                                .on('click' + eventNamespace, selector.text, module.event.text.focus);
                            if (module.is.multiple()) {
                                $module
                                    .on('click' + eventNamespace, module.event.click)
                                    .on('click' + eventNamespace, module.event.search.focus);
                            }
                        } else {
                            if (settings.on === 'click') {
                                $module
                                    .on('click' + eventNamespace, selector.icon, module.event.icon.click)
                                    .on('click' + eventNamespace, module.event.test.toggle);
                            } else if (settings.on === 'hover') {
                                $module
                                    .on('mouseenter' + eventNamespace, module.delay.show)
                                    .on('mouseleave' + eventNamespace, module.delay.hide)
                                    .on('touchstart' + eventNamespace, module.event.test.toggle)
                                    .on('touchstart' + eventNamespace, selector.icon, module.event.icon.click);
                            } else {
                                $module
                                    .on(settings.on + eventNamespace, module.toggle);
                            }
                            $module
                                .on('mousedown' + eventNamespace, module.event.mousedown)
                                .on('mouseup' + eventNamespace, module.event.mouseup)
                                .on('focus' + eventNamespace, module.event.focus)
                                .on('click' + eventNamespace, selector.clearIcon, module.event.clearIcon.click);
                            if (module.has.menuSearch()) {
                                $module
                                    .on('blur' + eventNamespace, selector.search, module.event.search.blur);
                            } else {
                                $module
                                    .on('blur' + eventNamespace, module.event.blur);
                            }
                        }
                        $menu
                            .on('mouseenter' + eventNamespace, selector.item, module.event.item.mouseenter)
                            .on('touchstart' + eventNamespace, selector.item, module.event.item.mouseenter)
                            .on('mouseleave' + eventNamespace, selector.item, module.event.item.mouseleave)
                            .on('click' + eventNamespace, selector.item, module.event.item.click);
                    },
                    intent: function () {
                        module.verbose('Binding hide intent event to document');
                        $document
                            .on('click' + elementNamespace, module.event.test.hide);
                    },
                },

                unbind: {
                    intent: function () {
                        module.verbose('Removing hide intent event from document');
                        $document
                            .off('click' + elementNamespace);
                    },
                },

                filter: function (query) {
                    let searchTerm = query !== undefined
                        ? query
                        : module.get.query();
                    let afterFiltered = function () {
                        if (module.is.multiple()) {
                            module.filterActive();
                        }
                        if (query || (!query && module.get.activeItem().length === 0)) {
                            module.select.firstUnfiltered();
                        }
                        if (module.has.allResultsFiltered()) {
                            if (settings.onNoResults.call(element, searchTerm)) {
                                if (settings.allowAdditions) {
                                    if (settings.hideAdditions) {
                                        module.verbose('User addition with no menu, setting empty style');
                                        module.set.empty();
                                        module.hideMenu();
                                    }
                                } else {
                                    module.verbose('All items filtered, showing message', searchTerm);
                                    module.add.message(message.noResults);
                                }
                            } else {
                                module.verbose('All items filtered, hiding dropdown', searchTerm);
                                module.set.empty();
                                module.hideMenu();
                            }
                        } else {
                            module.remove.empty();
                            module.remove.message();
                        }
                        if (settings.allowAdditions) {
                            module.add.userSuggestion(settings.preserveHTML
                                ? settings.templates.escape(query)
                                : query);
                        }
                        if (module.is.searchSelection() && module.can.show() && module.is.focusedOnSearch() && !module.is.empty()) {
                            module.show();
                        }
                    };
                    if (settings.useLabels && module.has.maxSelections()) {
                        module.show();

                        return;
                    }
                    if (settings.apiSettings) {
                        if (module.can.useAPI()) {
                            module.queryRemote(searchTerm, function () {
                                if (settings.filterRemoteData) {
                                    module.filterItems(searchTerm);
                                }
                                let preSelected = $input.val();
                                if (!Array.isArray(preSelected)) {
                                    preSelected = preSelected && preSelected !== '' ? preSelected.split(settings.delimiter) : [];
                                }
                                if (module.is.multiple()) {
                                    $.each(preSelected, function (index, value) {
                                        $item.filter('[data-' + metadata.value + '="' + CSS.escape(value) + '"]')
                                            .addClass(className.filtered);
                                    });
                                }
                                module.focusSearch(true);
                                afterFiltered();
                            });
                        } else {
                            module.error(error.noAPI);
                        }
                    } else {
                        module.filterItems(searchTerm);
                        afterFiltered();
                    }
                },

                queryRemote: function (query, callback, callbackParameters) {
                    if (!Array.isArray(callbackParameters)) {
                        callbackParameters = [callbackParameters];
                    }
                    let apiSettings = {
                        errorDuration: false,
                        cache: 'local',
                        throttle: settings.throttle,
                        urlData: {
                            query: query,
                        },
                    };
                    let apiCallbacks = {
                        onError: function (errorMessage, $module, xhr) {
                            module.add.message(message.serverError);
                            iconClicked = false;
                            focused = false;
                            callback.apply(null, callbackParameters);
                            if (typeof settings.apiSettings.onError === 'function') {
                                settings.apiSettings.onError.call(this, errorMessage, $module, xhr);
                            }
                        },
                        onFailure: function (response, $module, xhr) {
                            module.add.message(message.serverError);
                            iconClicked = false;
                            focused = false;
                            callback.apply(null, callbackParameters);
                            if (typeof settings.apiSettings.onFailure === 'function') {
                                settings.apiSettings.onFailure.call(this, response, $module, xhr);
                            }
                        },
                        onSuccess: function (response, $module, xhr) {
                            let values = response[fields.remoteValues];
                            if (!Array.isArray(values)) {
                                values = [];
                            }
                            module.remove.message();
                            let menuConfig = {};
                            menuConfig[fields.values] = values;
                            module.setup.menu(menuConfig);

                            if (values.length === 0 && !settings.allowAdditions) {
                                module.add.message(message.noResults);
                            } else {
                                let value = module.is.multiple() ? module.get.values() : module.get.value();
                                if (value !== '') {
                                    module.verbose('Value(s) present after click icon, select value(s) in items');
                                    module.set.selected(value, null, true, true);
                                }
                            }
                            iconClicked = false;
                            focused = false;
                            callback.apply(null, callbackParameters);
                            if (typeof settings.apiSettings.onSuccess === 'function') {
                                settings.apiSettings.onSuccess.call(this, response, $module, xhr);
                            }
                        },
                    };
                    if (!$module.api('get request')) {
                        module.setup.api();
                    }
                    apiSettings = $.extend(true, {}, apiSettings, settings.apiSettings, apiCallbacks, tempDisableApiCache ? { cache: false } : {});
                    $module
                        .api('setting', apiSettings)
                        .api('query');
                    tempDisableApiCache = false;
                },

                filterItems: function (query) {
                    let searchTerm = module.remove.diacritics(
                        query !== undefined
                            ? query
                            : module.get.query()
                    );
                    let results = null;
                    let escapedTerm = module.escape.string(searchTerm);
                    let regExpIgnore = settings.ignoreSearchCase ? 'i' : '';
                    let regExpFlags = regExpIgnore + 'gm';
                    let beginsWithRegExp = new RegExp('^' + escapedTerm, regExpFlags);
                    module.remove.filteredItem();
                    // avoid loop if we're matching nothing
                    if (module.has.query()) {
                        results = [];

                        module.verbose('Searching for matching values', searchTerm);
                        $item
                            .each(function () {
                                let $choice = $(this);
                                let text;
                                let value;
                                if ($choice.hasClass(className.unfilterable)) {
                                    results.push(this);

                                    return true;
                                }
                                if (settings.match === 'both' || settings.match === 'text') {
                                    text = module.remove.diacritics(String(module.get.choiceText($choice, false)));
                                    if (text.search(beginsWithRegExp) !== -1
                                        || (settings.fullTextSearch === 'exact' && module.exactSearch(searchTerm, text))
                                        || (settings.fullTextSearch === true && module.fuzzySearch(searchTerm, text))
                                    ) {
                                        results.push(this);

                                        return true;
                                    }
                                }
                                if (settings.match === 'both' || settings.match === 'value') {
                                    value = module.remove.diacritics(String(module.get.choiceValue($choice, text)));
                                    if (value.search(beginsWithRegExp) !== -1
                                        || (settings.fullTextSearch === 'exact' && module.exactSearch(searchTerm, value))
                                        || (settings.fullTextSearch === true && module.fuzzySearch(searchTerm, value))
                                    ) {
                                        results.push(this);

                                        return true;
                                    }
                                }
                            });
                    }
                    module.debug('Showing only matched items', searchTerm);
                    if (results) {
                        $item
                            .not(results)
                            .addClass(className.filtered);
                        if (settings.highlightMatches && (settings.match === 'both' || settings.match === 'text')) {
                            let querySplit = query.split('');
                            let diacriticReg = settings.ignoreDiacritics ? '[\u0300-\u036F]?' : '';
                            let htmlReg = '(?![^<]*>)';
                            let markedRegExp = new RegExp(htmlReg + '(' + querySplit.join(diacriticReg + ')(.*?)' + htmlReg + '(') + diacriticReg + ')', regExpIgnore);
                            let markedReplacer = function () {
                                let args = [].slice.call(arguments, 1, querySplit.length * 2).map(function (x, i) {
                                    return i & 1 ? x : '<mark>' + x + '</mark>'; // eslint-disable-line no-bitwise
                                });

                                return args.join('');
                            };
                            $.each(results, function (index, result) {
                                let $result = $(result);
                                let markedHTML = module.get.choiceText($result, true);
                                if (settings.ignoreDiacritics) {
                                    markedHTML = markedHTML.normalize('NFD');
                                }
                                $result.html(markedHTML.replace(markedRegExp, markedReplacer));
                            });
                        }
                    }

                    if (!module.has.query()) {
                        $divider
                            .removeClass(className.hidden);
                    } else if (settings.hideDividers === true) {
                        $divider
                            .addClass(className.hidden);
                    } else if (settings.hideDividers === 'empty') {
                        $divider
                            .removeClass(className.hidden)
                            .filter(function () {
                                // First find the last divider in this divider group
                                // Dividers which are direct siblings are considered a group
                                let $lastDivider = $(this).nextUntil(selector.item);

                                return ($lastDivider.length > 0 ? $lastDivider : $(this))
                                    // Count all non-filtered items until the next divider (or end of the dropdown)
                                    .nextUntil(selector.divider)
                                    .filter(selector.item + ':not(.' + className.filtered + ')')
                                    // Hide divider if no items are found
                                    .length === 0;
                            })
                            .addClass(className.hidden);
                    }
                },

                fuzzySearch: function (query, term) {
                    let termLength = term.length;
                    let queryLength = query.length;
                    if (settings.ignoreSearchCase) {
                        query = query.toLowerCase();
                        term = term.toLowerCase();
                    }
                    if (queryLength > termLength) {
                        return false;
                    }
                    if (queryLength === termLength) {
                        return query === term;
                    }
                    for (let characterIndex = 0, nextCharacterIndex = 0; characterIndex < queryLength; characterIndex++) {
                        let continueSearch = false;
                        let queryCharacter = query.charCodeAt(characterIndex);
                        while (nextCharacterIndex < termLength) {
                            if (term.charCodeAt(nextCharacterIndex++) === queryCharacter) {
                                continueSearch = true;

                                break;
                            }
                        }

                        if (!continueSearch) {
                            return false;
                        }
                    }

                    return true;
                },
                exactSearch: function (query, term) {
                    query = settings.ignoreSearchCase ? query.toLowerCase() : query;
                    term = settings.ignoreSearchCase ? term.toLowerCase() : term;

                    return term.indexOf(query) > -1;
                },
                filterActive: function () {
                    if (settings.useLabels) {
                        $item.filter('.' + className.active)
                            .addClass(className.filtered);
                    }
                },

                focusSearch: function (skipHandler) {
                    if (module.has.search() && !module.is.focusedOnSearch()) {
                        if (skipHandler) {
                            $module.off('focus' + eventNamespace, selector.search);
                            $search.trigger('focus');
                            $module.on('focus' + eventNamespace, selector.search, module.event.search.focus);
                        } else {
                            $search.trigger('focus');
                        }
                    }
                },

                blurSearch: function () {
                    if (module.has.search()) {
                        $search.trigger('blur');
                    }
                },

                forceSelection: function () {
                    let $currentlySelected = $item.not(className.filtered).filter('.' + className.selected).eq(0);
                    let $activeItem = $item.not(className.filtered).filter('.' + className.active).eq(0);
                    let $selectedItem = $currentlySelected.length > 0
                        ? $currentlySelected
                        : $activeItem;
                    let hasSelected = $selectedItem.length > 0;
                    if (settings.allowAdditions || (hasSelected && !module.is.multiple())) {
                        module.debug('Forcing partial selection to selected item', $selectedItem);
                        module.event.item.click.call($selectedItem, {}, true);
                    } else {
                        module.remove.searchTerm();
                    }
                },

                change: {
                    values: function (values) {
                        if (!settings.allowAdditions) {
                            module.clear();
                        }
                        module.debug('Creating dropdown with specified values', values);
                        let menuConfig = {};
                        menuConfig[fields.values] = values;
                        module.setup.menu(menuConfig);
                        $.each(values, function (index, item) {
                            if (item.selected === true) {
                                module.debug('Setting initial selection to', item[fields.value]);
                                module.set.selected(item[fields.value]);
                                if (!module.is.multiple()) {
                                    return false;
                                }
                            }
                        });

                        if (module.has.selectInput()) {
                            module.disconnect.selectObserver();
                            $input.html('');
                            $input.append('<option disabled selected value></option>');
                            $.each(values, function (index, item) {
                                let value = item[fields.value];
                                let name = item[fields.name] || '';
                                $input.append('<option value="' + settings.templates.escape(value) + '"' + (item.selected === true ? ' selected' : '') + '>' + settings.templates.escape(name, settings) + '</option>');
                            });
                            module.observe.select();
                        }
                    },
                },

                event: {
                    paste: function (event) {
                        let pasteValue = (event.originalEvent.clipboardData || window.clipboardData).getData('text');
                        let tokens = pasteValue.split(settings.delimiter);
                        let notFoundTokens = [];
                        tokens.forEach(function (value) {
                            value = value.trim();
                            const valueTrimmed = settings.preserveHTML
                                ? settings.templates.escape(value)
                                : value;
                            if (module.set.selected(valueTrimmed, null, false, true) === false) {
                                notFoundTokens.push(valueTrimmed);
                            }
                        });
                        event.preventDefault();
                        if (notFoundTokens.length > 0) {
                            let searchEl = $search[0];
                            let startPos = searchEl.selectionStart;
                            let endPos = searchEl.selectionEnd;
                            let orgText = searchEl.value;
                            let pasteText = notFoundTokens.join(settings.delimiter);
                            let newEndPos = startPos + pasteText.length;
                            $search.val(orgText.slice(0, startPos) + pasteText + orgText.slice(endPos));
                            searchEl.selectionStart = newEndPos;
                            searchEl.selectionEnd = newEndPos;
                            module.event.input(event);
                        }
                    },
                    change: function () {
                        if (!internalChange) {
                            module.debug('Input changed, updating selection');
                            module.set.selected();
                        }
                    },
                    focus: function () {
                        if (settings.showOnFocus && !activated && module.is.hidden() && !pageLostFocus) {
                            focused = true;
                            module.show();
                        }
                    },
                    blur: function (event) {
                        pageLostFocus = document.activeElement === this;
                        if (!activated && !pageLostFocus) {
                            module.remove.activeLabel();
                            module.hide();
                        }
                    },
                    mousedown: function () {
                        if (module.is.searchSelection(true)) {
                            // prevent the menu hiding on immediate re-focus
                            willRefocus = true;
                        } else {
                            // prevents focus callback from occurring on mousedown
                            activated = true;
                        }
                    },
                    mouseup: function () {
                        if (module.is.searchSelection(true)) {
                            // prevent the menu hiding on immediate re-focus
                            willRefocus = false;
                        } else {
                            activated = false;
                        }
                    },
                    click: function (event) {
                        let $target = $(event.target);
                        // focus search
                        if ($target.is($module)) {
                            if (!module.is.focusedOnSearch()) {
                                module.focusSearch();
                            } else {
                                module.show();
                            }
                        }
                    },
                    search: {
                        focus: function (event) {
                            activated = true;
                            if (module.is.multiple()) {
                                module.remove.activeLabel();
                            }
                            if (!focused && !module.is.active() && (settings.showOnFocus || (event.type !== 'focus' && event.type !== 'focusin')) && event.type !== 'touchstart') {
                                focused = true;
                                module.search();
                            }
                        },
                        blur: function (event) {
                            pageLostFocus = document.activeElement === this;
                            if (module.is.searchSelection(true) && !willRefocus) {
                                if (!itemActivated && !pageLostFocus) {
                                    if (settings.forceSelection) {
                                        module.forceSelection();
                                    } else if (!settings.allowAdditions && !settings.keepSearchTerm && !module.has.menuSearch()) {
                                        module.remove.searchTerm();
                                    }
                                    module.hide();
                                }
                            }
                            willRefocus = false;
                        },
                    },
                    clearIcon: {
                        click: function (event) {
                            module.clear();
                            if (module.is.searchSelection()) {
                                module.remove.searchTerm();
                            }
                            if (settings.collapseOnClearable) {
                                module.hide();
                            }
                            event.stopPropagation();
                        },
                    },
                    icon: {
                        click: function (event) {
                            iconClicked = true;
                            if (module.has.search()) {
                                if (!module.is.active()) {
                                    if (settings.showOnFocus) {
                                        module.focusSearch();
                                    } else {
                                        module.toggle();
                                    }
                                } else {
                                    module.blurSearch();
                                }
                            } else {
                                module.toggle();
                            }
                            event.stopPropagation();
                        },
                    },
                    text: {
                        focus: function (event) {
                            activated = true;
                            module.focusSearch();
                        },
                    },
                    input: function (event) {
                        if (module.is.multiple() || module.is.searchSelection()) {
                            module.set.filtered();
                        }
                        clearTimeout(module.timer);
                        module.timer = setTimeout(function () {
                            module.search();
                        }, settings.delay.search);
                    },
                    label: {
                        click: function (event) {
                            let $label = $(this);
                            let $labels = $module.find(selector.label);
                            let $activeLabels = $labels.filter('.' + className.active);
                            let $nextActive = $label.nextAll('.' + className.active);
                            let $prevActive = $label.prevAll('.' + className.active);
                            let $range = $nextActive.length > 0
                                ? $label.nextUntil($nextActive).add($activeLabels).add($label)
                                : $label.prevUntil($prevActive).add($activeLabels).add($label);
                            if (event.shiftKey) {
                                $activeLabels.removeClass(className.active);
                                $range.addClass(className.active);
                            } else if (event.ctrlKey) {
                                $label.toggleClass(className.active);
                            } else {
                                $activeLabels.removeClass(className.active);
                                $label.addClass(className.active);
                            }
                            settings.onLabelSelect.apply(this, $labels.filter('.' + className.active));
                            event.stopPropagation();
                        },
                    },
                    remove: {
                        click: function (event) {
                            let $label = $(this).parent();
                            if ($label.hasClass(className.active)) {
                                // remove all selected labels
                                module.remove.activeLabels();
                            } else {
                                // remove this label only
                                module.remove.activeLabels($label);
                            }
                            event.stopPropagation();
                        },
                    },
                    test: {
                        toggle: function (event) {
                            let toggleBehavior = module.is.multiple()
                                ? module.show
                                : module.toggle;
                            if (module.is.bubbledLabelClick(event) || module.is.bubbledIconClick(event)) {
                                return;
                            }
                            if (!module.is.multiple() || (module.is.multiple() && !module.is.active())) {
                                focused = true;
                            }
                            if (module.determine.eventOnElement(event, toggleBehavior) && event.type !== 'touchstart') {
                                // do not preventDefault of touchstart; so emulated mouseenter is triggered on first touch and not later
                                // (when selecting an item). The double-showing of the dropdown through both events does not hurt.
                                event.preventDefault();
                            }
                        },
                        hide: function (event) {
                            if (module.determine.eventInModule(event, module.hide)) {
                                if (element.id && $(event.target).attr('for') === element.id) {
                                    event.preventDefault();
                                }
                            }
                        },
                    },
                    class: {
                        mutation: function (mutations) {
                            mutations.forEach(function (mutation) {
                                if (mutation.attributeName === 'class') {
                                    module.check.disabled();
                                }
                            });
                        },
                    },
                    select: {
                        mutation: function (mutations) {
                            if (module.is.selectMutation(mutations)) {
                                module.debug('<select> modified, recreating menu');
                                module.disconnect.selectObserver();
                                module.refresh();
                                module.setup.select();
                                module.set.selected();
                                module.observe.select();
                            }
                        },
                    },
                    menu: {
                        mutation: function (mutations) {
                            let mutation = mutations[0];
                            let $addedNode = mutation.addedNodes
                                ? $(mutation.addedNodes[0])
                                : $(false);
                            let $removedNode = mutation.removedNodes
                                ? $(mutation.removedNodes[0])
                                : $(false);
                            let $changedNodes = $addedNode.add($removedNode);
                            let isUserAddition = $changedNodes.is(selector.addition) || $changedNodes.closest(selector.addition).length > 0;
                            let isMessage = $changedNodes.is(selector.message) || $changedNodes.closest(selector.message).length > 0;
                            if (isUserAddition || isMessage) {
                                module.debug('Updating item selector cache');
                                module.refreshItems();
                            } else {
                                module.debug('Menu modified, updating selector cache');
                                module.refresh();
                            }
                        },
                        mousedown: function () {
                            itemActivated = true;
                        },
                        mouseup: function () {
                            itemActivated = false;
                        },
                    },
                    item: {
                        mouseenter: function (event) {
                            let $target = $(event.target);
                            let $item = $(this);
                            let $subMenu = $item.children(selector.menu);
                            let $otherMenus = $item.siblings(selector.item).children(selector.menu);
                            let hasSubMenu = $subMenu.length > 0;
                            let isBubbledEvent = $subMenu.find($target).length > 0;
                            if (!isBubbledEvent && hasSubMenu) {
                                clearTimeout(module.itemTimer);
                                module.itemTimer = setTimeout(function () {
                                    module.verbose('Showing sub-menu', $subMenu);
                                    $.each($otherMenus, function () {
                                        module.animate.hide(false, $(this));
                                    });
                                    module.animate.show(false, $subMenu);
                                }, settings.delay.show);
                                event.preventDefault();
                            }
                        },
                        mouseleave: function (event) {
                            let $subMenu = $(this).find(selector.menu);
                            if ($subMenu.length > 0) {
                                clearTimeout(module.itemTimer);
                                module.itemTimer = setTimeout(function () {
                                    module.verbose('Hiding sub-menu', $subMenu);
                                    $subMenu.each(function () {
                                        module.animate.hide(false, $(this));
                                    });
                                }, settings.delay.hide);
                            }
                        },
                        click: function (event, skipRefocus) {
                            let $choice = $(this);
                            let $target = event
                                ? $(event.target || '')
                                : $('');
                            let $subMenu = $choice.find(selector.menu);
                            let text = module.get.choiceText($choice);
                            let value = module.get.choiceValue($choice, text);
                            let hasSubMenu = $subMenu.length > 0;
                            let isBubbledEvent = $subMenu.find($target).length > 0;
                            if (document.activeElement.tagName.toLowerCase() !== 'input') {
                                $(document.activeElement).trigger('blur');
                            }
                            if (!isBubbledEvent && (!hasSubMenu || settings.allowCategorySelection)) {
                                if (module.is.searchSelection()) {
                                    if (settings.allowAdditions) {
                                        module.remove.userAddition();
                                    }
                                    if (!settings.keepSearchTerm) {
                                        if (module.is.multiple()) {
                                            module.remove.filteredItem();
                                        }
                                        module.remove.searchTerm();
                                    }
                                    if (!module.is.visible() && $target.length > 0) {
                                        module.show();
                                    }
                                    if (!module.is.focusedOnSearch() && skipRefocus !== true) {
                                        module.focusSearch(true);
                                    }
                                }
                                if (!settings.useLabels) {
                                    module.remove.filteredItem();
                                    module.set.scrollPosition($choice);
                                }
                                module.determine.selectAction.call(this, text, value);
                            }
                        },
                    },

                    document: {
                        // label selection should occur even when the element has no focus
                        keydown: function (event) {
                            let pressedKey = event.which;
                            let isShortcutKey = module.is.inObject(pressedKey, keys);
                            if (isShortcutKey) {
                                let $label = $module.find(selector.label);
                                let $activeLabel = $label.filter('.' + className.active);
                                let activeValue = $activeLabel.data(metadata.value);
                                let labelIndex = $label.index($activeLabel);
                                let labelCount = $label.length;
                                let hasActiveLabel = $activeLabel.length > 0;
                                let hasMultipleActive = $activeLabel.length > 1;
                                let isFirstLabel = labelIndex === 0;
                                let isLastLabel = labelIndex + 1 === labelCount;
                                let isSearch = module.is.searchSelection();
                                let isFocusedOnSearch = module.is.focusedOnSearch();
                                let isFocused = module.is.focused();
                                let caretAtStart = isFocusedOnSearch && module.get.caretPosition(false) === 0;
                                let isSelectedSearch = caretAtStart && module.get.caretPosition(true) !== 0;
                                if (isSearch && !hasActiveLabel && !isFocusedOnSearch) {
                                    return;
                                }

                                switch (pressedKey) {
                                    case keys.leftArrow: {
                                        // activate previous label
                                        if ((isFocused || caretAtStart) && !hasActiveLabel) {
                                            module.verbose('Selecting previous label');
                                            $label.last().addClass(className.active);
                                        } else if (hasActiveLabel) {
                                            if (!event.shiftKey) {
                                                module.verbose('Selecting previous label');
                                                $label.removeClass(className.active);
                                            } else {
                                                module.verbose('Adding previous label to selection');
                                            }
                                            if (isFirstLabel && !hasMultipleActive) {
                                                $activeLabel.addClass(className.active);
                                            } else {
                                                $activeLabel.prev(selector.siblingLabel)
                                                    .addClass(className.active)
                                                    .end();
                                            }
                                            event.preventDefault();
                                        }

                                        break;
                                    }
                                    case keys.rightArrow: {
                                        // activate first label
                                        if (isFocused && !hasActiveLabel) {
                                            $label.first().addClass(className.active);
                                        }
                                        // activate next label
                                        if (hasActiveLabel) {
                                            if (!event.shiftKey) {
                                                module.verbose('Selecting next label');
                                                $label.removeClass(className.active);
                                            } else {
                                                module.verbose('Adding next label to selection');
                                            }
                                            if (isLastLabel) {
                                                if (isSearch) {
                                                    if (!isFocusedOnSearch) {
                                                        module.focusSearch();
                                                    } else {
                                                        $label.removeClass(className.active);
                                                    }
                                                } else if (hasMultipleActive) {
                                                    $activeLabel.next(selector.siblingLabel).addClass(className.active);
                                                } else {
                                                    $activeLabel.addClass(className.active);
                                                }
                                            } else {
                                                $activeLabel.next(selector.siblingLabel).addClass(className.active);
                                            }
                                            event.preventDefault();
                                        }

                                        break;
                                    }
                                    case keys.deleteKey:
                                    case keys.backspace: {
                                        if (hasActiveLabel) {
                                            module.verbose('Removing active labels');
                                            if (isLastLabel) {
                                                if (isSearch && !isFocusedOnSearch) {
                                                    module.focusSearch();
                                                }
                                            }
                                            $activeLabel.last().next(selector.siblingLabel).addClass(className.active);
                                            module.remove.activeLabels($activeLabel);
                                            if (!module.is.visible()) {
                                                module.show();
                                            }
                                            event.preventDefault();
                                        } else if (caretAtStart && !isSelectedSearch && !hasActiveLabel && pressedKey === keys.backspace) {
                                            module.verbose('Removing last label on input backspace');
                                            $activeLabel = $label.last().addClass(className.active);
                                            module.remove.activeLabels($activeLabel);
                                            if (!module.is.visible()) {
                                                module.show();
                                            }
                                        }

                                        break;
                                    }
                                    default: {
                                        $activeLabel.removeClass(className.active);
                                    }
                                }
                            }
                        },
                    },

                    keydown: function (event) {
                        let pressedKey = event.which;
                        let isShortcutKey = module.is.inObject(pressedKey, keys) || event.key === settings.delimiter;
                        if (isShortcutKey) {
                            let $currentlySelected = $item.not(selector.unselectable).filter('.' + className.selected).eq(0);
                            let $activeItem = $menu.children('.' + className.active).eq(0);
                            let $selectedItem = $currentlySelected.length > 0
                                ? $currentlySelected
                                : $activeItem;
                            let $visibleItems = $selectedItem.length > 0
                                ? $selectedItem.siblings(':not(.' + className.filtered + ')').addBack()
                                : $menu.children(':not(.' + className.filtered + ')');
                            let $subMenu = $selectedItem.children(selector.menu);
                            let $parentMenu = $selectedItem.closest(selector.menu);
                            let inVisibleMenu = $parentMenu.hasClass(className.visible) || $parentMenu.hasClass(className.animating) || $parentMenu.parent(selector.menu).length > 0;
                            let hasSubMenu = $subMenu.length > 0;
                            let hasSelectedItem = $selectedItem.length > 0;
                            let selectedIsSelectable = $selectedItem.not(selector.unselectable).length > 0;
                            let delimiterPressed = event.key === settings.delimiter && module.is.multiple();
                            let isAdditionWithoutMenu = settings.allowAdditions && (pressedKey === keys.enter || delimiterPressed);
                            let $nextItem;
                            let isSubMenuItem;
                            // allow selection with the menu closed
                            if (isAdditionWithoutMenu) {
                                if (selectedIsSelectable && settings.hideAdditions) {
                                    module.verbose('Selecting item from keyboard shortcut', $selectedItem);
                                    module.event.item.click.call($selectedItem, event);
                                }
                                if (module.is.searchSelection() && !settings.keepSearchTerm) {
                                    module.remove.searchTerm();
                                }
                                if (module.is.multiple()) {
                                    event.preventDefault();
                                }
                            }

                            // visible menu keyboard shortcuts
                            if (module.is.visible()) {
                                // enter (select or open submenu)
                                if (pressedKey === keys.enter || delimiterPressed) {
                                    if (pressedKey === keys.enter && hasSelectedItem && hasSubMenu && !settings.allowCategorySelection) {
                                        module.verbose('Pressed enter on unselectable category, opening sub menu');
                                        pressedKey = keys.rightArrow;
                                    } else if (selectedIsSelectable) {
                                        module.verbose('Selecting item from keyboard shortcut', $selectedItem);
                                        module.event.item.click.call($selectedItem, event);
                                        if (module.is.searchSelection()) {
                                            if (!settings.keepSearchTerm) {
                                                module.remove.searchTerm();
                                            }
                                            if (module.is.multiple()) {
                                                $search.trigger('focus');
                                            }
                                        }
                                    }
                                    event.preventDefault();
                                }

                                // sub-menu actions
                                if (hasSelectedItem) {
                                    if (pressedKey === keys.leftArrow) {
                                        isSubMenuItem = $parentMenu[0] !== $menu[0];

                                        if (isSubMenuItem) {
                                            module.verbose('Left key pressed, closing sub-menu');
                                            module.animate.hide(false, $parentMenu);
                                            $selectedItem
                                                .removeClass(className.selected);
                                            $parentMenu
                                                .closest(selector.item)
                                                .addClass(className.selected);
                                            event.preventDefault();
                                        }
                                    }

                                    // right arrow (show submenu)
                                    if (pressedKey === keys.rightArrow) {
                                        if (hasSubMenu) {
                                            module.verbose('Right key pressed, opening sub-menu');
                                            module.animate.show(false, $subMenu);
                                            $selectedItem
                                                .removeClass(className.selected);
                                            $subMenu
                                                .find(selector.item).eq(0)
                                                .addClass(className.selected);
                                            event.preventDefault();
                                        }
                                    }
                                }

                                // up arrow (traverse menu up)
                                if (pressedKey === keys.upArrow) {
                                    $nextItem = hasSelectedItem && inVisibleMenu
                                        ? $selectedItem.prevAll(selector.item + ':not(' + selector.unselectable + ')').eq(0)
                                        : $item.eq(0);
                                    if ($visibleItems.index($nextItem) < 0) {
                                        module.verbose('Up key pressed but reached top of current menu');
                                        event.preventDefault();

                                        return;
                                    }

                                    module.verbose('Up key pressed, changing active item');
                                    $selectedItem
                                        .removeClass(className.selected);
                                    $nextItem
                                        .addClass(className.selected);
                                    module.set.scrollPosition($nextItem);
                                    if (settings.selectOnKeydown && module.is.single() && !$nextItem.hasClass(className.actionable)) {
                                        module.set.selectedItem($nextItem);
                                    }

                                    event.preventDefault();
                                }

                                // down arrow (traverse menu down)
                                if (pressedKey === keys.downArrow) {
                                    $nextItem = hasSelectedItem && inVisibleMenu
                                        ? $selectedItem.nextAll(selector.item + ':not(' + selector.unselectable + ')').eq(0)
                                        : $item.eq(0);
                                    if ($nextItem.length === 0) {
                                        module.verbose('Down key pressed but reached bottom of current menu');
                                        event.preventDefault();

                                        return;
                                    }

                                    module.verbose('Down key pressed, changing active item');
                                    $item
                                        .removeClass(className.selected);
                                    $nextItem
                                        .addClass(className.selected);
                                    module.set.scrollPosition($nextItem);
                                    if (settings.selectOnKeydown && module.is.single() && !$nextItem.hasClass(className.actionable)) {
                                        module.set.selectedItem($nextItem);
                                    }

                                    event.preventDefault();
                                }

                                // page down (show next page)
                                if (pressedKey === keys.pageUp) {
                                    module.scrollPage('up');
                                    event.preventDefault();
                                }
                                if (pressedKey === keys.pageDown) {
                                    module.scrollPage('down');
                                    event.preventDefault();
                                }

                                // escape (close menu)
                                if (pressedKey === keys.escape) {
                                    module.verbose('Escape key pressed, closing dropdown');
                                    module.hide();
                                    event.stopPropagation();
                                }
                            } else {
                                // delimiter key
                                if (pressedKey === keys.enter || delimiterPressed) {
                                    event.preventDefault();
                                }
                                // down arrow (open menu)
                                if (pressedKey === keys.downArrow && !module.is.visible()) {
                                    focused = true;
                                    module.verbose('Down key pressed, showing dropdown');
                                    module.show();
                                    event.preventDefault();
                                }
                            }
                        } else {
                            if (!module.has.search()) {
                                module.set.selectedLetter(String.fromCharCode(pressedKey));
                            }
                        }
                    },
                },

                trigger: {
                    change: function () {
                        let inputElement = $input[0];
                        if (inputElement) {
                            let events = document.createEvent('HTMLEvents');
                            module.verbose('Triggering native change event');
                            events.initEvent('change', true, false);
                            inputElement.dispatchEvent(events);
                        }
                    },
                },

                determine: {
                    selectAction: function (text, value) {
                        selectActionActive = true;
                        module.verbose('Determining action', settings.action);
                        if (isFunction(module.action[settings.action])) {
                            module.verbose('Triggering preset action', settings.action, text, value);
                            module.action[settings.action].call(element, text, value, this);
                        } else if (isFunction(settings.action)) {
                            module.verbose('Triggering user action', settings.action, text, value);
                            settings.action.call(element, text, value, this);
                        } else {
                            module.error(error.action, settings.action);
                        }
                        selectActionActive = false;
                    },
                    eventInModule: function (event, callback) {
                        let $target = $(event.target);
                        let inDocument = $target.closest(document.documentElement).length > 0;
                        let inModule = $target.closest($module).length > 0;
                        callback = isFunction(callback)
                            ? callback
                            : function () {};
                        if (inDocument && !inModule) {
                            module.verbose('Triggering event', callback);
                            callback();

                            return true;
                        }

                        module.verbose('Event occurred in dropdown, canceling callback');

                        return false;
                    },
                    eventOnElement: function (event, callback) {
                        let $target = $(event.target);
                        let $label = $target.closest(selector.siblingLabel);
                        let inVisibleDOM = document.body.contains(event.target);
                        let notOnLabel = $module.find($label).length === 0 || !(module.is.multiple() && settings.useLabels);
                        let notInMenu = $target.closest($menu).length === 0;
                        callback = isFunction(callback)
                            ? callback
                            : function () {};
                        if (inVisibleDOM && notOnLabel && notInMenu) {
                            module.verbose('Triggering event', callback);
                            callback();

                            return true;
                        }

                        module.verbose('Event occurred in dropdown menu, canceling callback');

                        return false;
                    },
                },

                action: {

                    nothing: function () {},

                    activate: function (text, value, element) {
                        value = value !== undefined
                            ? value
                            : text;
                        if (module.can.activate($(element))) {
                            module.set.selected(value, $(element), false, settings.keepSearchTerm);
                            if (!module.is.multiple() && !(!settings.collapseOnActionable && $(element).hasClass(className.actionable))) {
                                module.hideAndClear();
                            }
                        }
                    },

                    select: function (text, value, element) {
                        value = value !== undefined
                            ? value
                            : text;
                        if (module.can.activate($(element))) {
                            module.set.value(value, text, $(element));
                            if (!module.is.multiple() && !(!settings.collapseOnActionable && $(element).hasClass(className.actionable))) {
                                module.hideAndClear();
                            }
                        }
                    },

                    combo: function (text, value, element) {
                        value = value !== undefined
                            ? value
                            : text;
                        module.set.selected(value, $(element));
                        module.hideAndClear();
                    },

                    hide: function (text, value, element) {
                        module.set.value(value, text, $(element));
                        module.hideAndClear();
                    },

                },

                get: {
                    id: function () {
                        return id;
                    },
                    defaultText: function () {
                        return $module.data(metadata.defaultText);
                    },
                    defaultValue: function () {
                        return $module.data(metadata.defaultValue);
                    },
                    placeholderText: function () {
                        if (settings.placeholder !== 'auto' && typeof settings.placeholder === 'string') {
                            return settings.placeholder;
                        }

                        return $module.data(metadata.placeholderText) || '';
                    },
                    text: function () {
                        return settings.preserveHTML
                            ? $text.html()
                            : $text.text();
                    },
                    query: function () {
                        return String($search.val()).trim();
                    },
                    searchWidth: function (value) {
                        value = value !== undefined
                            ? value
                            : $search.val();
                        $sizer.text(value);

                        // prevent rounding issues
                        return Math.ceil($sizer.width() + 1);
                    },
                    selectionCount: function () {
                        let values = module.get.values();
                        let count;
                        count = module.is.multiple()
                            ? (Array.isArray(values) ? values.length : 0)
                            : (module.get.value() !== '' ? 1 : 0);

                        return count;
                    },
                    transition: function ($subMenu) {
                        return settings.transition === 'auto'
                            ? (module.is.upward($subMenu) ? 'slide up' : 'slide down')
                            : settings.transition;
                    },
                    userValues: function () {
                        let values = module.get.values();
                        if (!values) {
                            return false;
                        }
                        values = Array.isArray(values)
                            ? values
                            : [values];

                        return $.grep(values, function (value) {
                            return module.get.item(value) === false;
                        });
                    },
                    uniqueArray: function (array) {
                        return $.grep(array, function (value, index) {
                            return $.inArray(value, array) === index;
                        });
                    },
                    caretPosition: function (returnEndPos) {
                        let input = $search[0];
                        let range;
                        let rangeLength;
                        if (returnEndPos && 'selectionEnd' in input) {
                            return input.selectionEnd;
                        }
                        if (!returnEndPos && 'selectionStart' in input) {
                            return input.selectionStart;
                        }
                        if (document.selection) {
                            input.focus();
                            range = document.selection.createRange();
                            rangeLength = range.text.length;
                            if (returnEndPos) {
                                return rangeLength;
                            }
                            range.moveStart('character', -input.value.length);

                            return range.text.length - rangeLength;
                        }
                    },
                    value: function () {
                        let value = $input.length > 0
                            ? $input.val()
                            : $module.data(metadata.value);
                        let isEmptyMultiselect = Array.isArray(value) && value.length === 1 && value[0] === '';

                        // prevents the placeholder element from being selected when multiple
                        return value === undefined || isEmptyMultiselect
                            ? ''
                            : value;
                    },
                    values: function () {
                        let value = module.get.value();
                        if (value === '') {
                            return '';
                        }

                        return !module.has.selectInput() && module.is.multiple()
                            ? (typeof value === 'string' // delimited string
                                ? value.split(settings.delimiter)
                                : '')
                            : value;
                    },
                    remoteValues: function () {
                        let values = module.get.values();
                        let remoteValues = false;
                        if (values) {
                            if (typeof values === 'string') {
                                values = [values];
                            }
                            $.each(values, function (index, value) {
                                let name = module.read.remoteData(value);
                                module.verbose('Restoring value from session data', name, value);
                                if (name) {
                                    if (!remoteValues) {
                                        remoteValues = {};
                                    }
                                    remoteValues[value] = name;
                                }
                            });
                        }

                        return remoteValues;
                    },
                    choiceText: function ($choice, preserveHTML) {
                        preserveHTML = preserveHTML !== undefined
                            ? preserveHTML
                            : settings.preserveHTML;
                        if ($choice) {
                            if ($choice.find(selector.menu).length > 0) {
                                module.verbose('Retrieving text of element with sub-menu');
                                $choice = $choice.clone();
                                $choice.find(selector.menu).remove();
                                $choice.find(selector.menuIcon).remove();
                            }

                            return $choice.data(metadata.text) !== undefined
                                ? $choice.data(metadata.text)
                                : (preserveHTML
                                    ? $choice.html() && $choice.html().trim()
                                    : $choice.text() && $choice.text().trim());
                        }
                    },
                    choiceValue: function ($choice, choiceText) {
                        choiceText = choiceText || module.get.choiceText($choice);
                        if (!$choice) {
                            return false;
                        }

                        return $choice.data(metadata.value) !== undefined
                            ? String($choice.data(metadata.value))
                            : (typeof choiceText === 'string'
                                ? String(
                                    settings.ignoreSearchCase
                                        ? choiceText.toLowerCase()
                                        : choiceText
                                ).trim()
                                : String(choiceText));
                    },
                    inputEvent: function () {
                        let input = $search[0];
                        if (input) {
                            return input.oninput !== undefined
                                ? 'input'
                                : (input.onpropertychange !== undefined
                                    ? 'propertychange'
                                    : 'keyup');
                        }

                        return false;
                    },
                    selectValues: function () {
                        let select = {};
                        let oldGroup = [];
                        let values = [];
                        $module
                            .find('option')
                            .each(function () {
                                let $option = $(this);
                                let name = module.escape.assumeUnescapedAmpLtGt($option.html());
                                let disabled = $option.attr('disabled');
                                let value = $option.attr('value') !== undefined
                                    ? $option.attr('value')
                                    : name;
                                let text = $option.data(metadata.text) !== undefined
                                    ? $option.data(metadata.text)
                                    : name;
                                let group = $option.parent('optgroup');
                                if (settings.placeholder === 'auto' && value === '') {
                                    select.placeholder = name;
                                } else {
                                    if (group.length !== oldGroup.length || group[0] !== oldGroup[0]) {
                                        values.push({
                                            type: 'header',
                                            divider: settings.headerDivider,
                                            name: group.attr('label') || '',
                                        });
                                        oldGroup = group;
                                    }
                                    values.push({
                                        name: name,
                                        value: value,
                                        text: text,
                                        disabled: disabled,
                                    });
                                }
                            });
                        if (settings.placeholder && settings.placeholder !== 'auto') {
                            module.debug('Setting placeholder value to', settings.placeholder);
                            select.placeholder = settings.placeholder;
                        }
                        if (settings.sortSelect) {
                            if (settings.sortSelect === true) {
                                values.sort(function (a, b) {
                                    return a.name.localeCompare(b.name);
                                });
                            } else if (settings.sortSelect === 'natural') {
                                values.sort(function (a, b) {
                                    return a.name.toLowerCase().localeCompare(b.name.toLowerCase());
                                });
                            } else if (isFunction(settings.sortSelect)) {
                                values.sort(settings.sortSelect);
                            }
                            select[fields.values] = values;
                            module.debug('Retrieved and sorted values from select', select);
                        } else {
                            select[fields.values] = values;
                            module.debug('Retrieved values from select', select);
                        }

                        return select;
                    },
                    activeItem: function () {
                        return $item.filter('.' + className.active);
                    },
                    selectedItem: function () {
                        let $selectedItem = $item.not(selector.unselectable).filter('.' + className.selected);

                        return $selectedItem.length > 0
                            ? $selectedItem
                            : $item.eq(0);
                    },
                    itemWithAdditions: function (value) {
                        let $items = module.get.item(value);
                        let $userItems = module.create.userChoice(value);
                        let hasUserItems = $userItems && $userItems.length > 0;
                        if (hasUserItems) {
                            $items = $items.length > 0
                                ? $items.add($userItems)
                                : $userItems;
                        }

                        return $items;
                    },
                    item: function (value, strict) {
                        let $selectedItem = false;
                        let shouldSearch;
                        let isMultiple;
                        value = value !== undefined
                            ? value
                            : (module.get.values() !== undefined
                                ? module.get.values()
                                : module.get.text());
                        isMultiple = module.is.multiple() && Array.isArray(value);
                        shouldSearch = isMultiple
                            ? value.length > 0
                            : value !== undefined && value !== null;
                        strict = value === '' || value === false || value === true
                            ? true
                            : strict || false;
                        if (shouldSearch) {
                            $item
                                .each(function () {
                                    let $choice = $(this);
                                    let optionText = module.get.choiceText($choice);
                                    let optionValue = module.get.choiceValue($choice, optionText);
                                    // safe early exit
                                    if (optionValue === null || optionValue === undefined) {
                                        return;
                                    }
                                    if (isMultiple) {
                                        if ($.inArray(String(optionValue), value.map(String)) !== -1) {
                                            $selectedItem = $selectedItem
                                                ? $selectedItem.add($choice)
                                                : $choice;
                                        }
                                    } else if (strict) {
                                        module.verbose('Ambiguous dropdown value using strict type check', $choice, value);
                                        if (optionValue === value) {
                                            $selectedItem = $choice;

                                            return true;
                                        }
                                    } else {
                                        if (settings.ignoreCase) {
                                            optionValue = optionValue.toLowerCase();
                                            value = value.toLowerCase();
                                        }
                                        if (String(optionValue) === String(value)) {
                                            module.verbose('Found select item by value', optionValue, value);
                                            $selectedItem = $choice;

                                            return true;
                                        }
                                    }
                                });
                        }

                        return $selectedItem;
                    },
                    displayType: function () {
                        return $module.hasClass('column') ? 'flex' : settings.displayType;
                    },
                },

                check: {
                    maxSelections: function (selectionCount) {
                        if (settings.maxSelections) {
                            selectionCount = selectionCount !== undefined
                                ? selectionCount
                                : module.get.selectionCount();
                            if (selectionCount >= settings.maxSelections) {
                                module.debug('Maximum selection count reached');
                                if (settings.useLabels) {
                                    $item.addClass(className.filtered);
                                    module.add.message(message.maxSelections);
                                }

                                return true;
                            }

                            module.verbose('No longer at maximum selection count');
                            module.remove.message();
                            module.remove.filteredItem();
                            if (module.is.searchSelection()) {
                                module.filterItems();
                            }

                            return false;
                        }

                        return false;
                    },
                    disabled: function () {
                        $search.attr('tabindex', module.is.disabled() ? -1 : 0);
                    },
                },

                restore: {
                    defaults: function (preventChangeTrigger) {
                        module.clear(preventChangeTrigger);
                        module.restore.defaultText();
                        module.restore.defaultValue();
                    },
                    defaultText: function () {
                        let defaultText = module.get.defaultText();
                        let placeholderText = module.get.placeholderText;
                        if (defaultText === placeholderText) {
                            module.debug('Restoring default placeholder text', defaultText);
                            module.set.placeholderText(defaultText);
                        } else {
                            module.debug('Restoring default text', defaultText);
                            module.set.text(defaultText);
                        }
                    },
                    placeholderText: function () {
                        module.set.placeholderText();
                    },
                    defaultValue: function () {
                        let defaultValue = module.get.defaultValue();
                        if (defaultValue !== undefined) {
                            module.debug('Restoring default value', defaultValue);
                            if (defaultValue !== '') {
                                module.set.value(defaultValue);
                                module.set.selected();
                            } else {
                                module.remove.activeItem();
                                module.remove.selectedItem();
                            }
                        }
                    },
                    labels: function () {
                        if (settings.allowAdditions) {
                            if (!settings.useLabels) {
                                module.error(error.labels);
                                settings.useLabels = true;
                            }
                            module.debug('Restoring selected values');
                            module.create.userLabels();
                        }
                        module.check.maxSelections();
                    },
                    selected: function () {
                        module.restore.values();
                        if (module.is.multiple()) {
                            module.debug('Restoring previously selected values and labels');
                            module.restore.labels();
                        } else {
                            module.debug('Restoring previously selected values');
                        }
                    },
                    values: function () {
                        // prevents callbacks from occurring on the initial load
                        module.set.initialLoad();
                        if (settings.apiSettings && settings.saveRemoteData && module.get.remoteValues()) {
                            module.restore.remoteValues();
                        } else {
                            module.set.selected();
                        }
                        let value = module.get.value();
                        if (value && value !== '' && !(Array.isArray(value) && value.length === 0)) {
                            $input.removeClass(className.noselection);
                        } else {
                            $input.addClass(className.noselection);
                        }
                        module.remove.initialLoad();
                    },
                    remoteValues: function () {
                        let values = module.get.remoteValues();
                        module.debug('Recreating selected from session data', values);
                        if (values) {
                            if (module.is.single()) {
                                $.each(values, function (value, name) {
                                    module.set.text(name);
                                });
                            } else if (settings.useLabels) {
                                $.each(values, function (value, name) {
                                    module.add.label(value, name);
                                });
                            }
                        }
                    },
                },

                read: {
                    remoteData: function (value) {
                        let name;
                        if (window.Storage === undefined) {
                            module.error(error.noStorage);

                            return;
                        }
                        name = sessionStorage.getItem(value + elementNamespace);

                        return name !== undefined
                            ? name
                            : false;
                    },
                },

                save: {
                    defaults: function () {
                        module.save.defaultText();
                        module.save.placeholderText();
                        module.save.defaultValue();
                    },
                    defaultValue: function () {
                        let value = module.get.value();
                        module.verbose('Saving default value as', value);
                        $module.data(metadata.defaultValue, value);
                    },
                    defaultText: function () {
                        let text = module.get.text();
                        module.verbose('Saving default text as', text);
                        $module.data(metadata.defaultText, text);
                    },
                    placeholderText: function () {
                        let text;
                        if (settings.placeholder !== false && $text.hasClass(className.placeholder)) {
                            text = module.get.text();
                            module.verbose('Saving placeholder text as', text);
                            $module.data(metadata.placeholderText, text);
                        }
                    },
                    remoteData: function (name, value) {
                        if (window.Storage === undefined) {
                            module.error(error.noStorage);

                            return;
                        }
                        module.verbose('Saving remote data to session storage', value, name);
                        sessionStorage.setItem(value + elementNamespace, name);
                    },
                },

                clear: function (preventChangeTrigger) {
                    if (module.is.multiple() && settings.useLabels) {
                        module.remove.labels($module.find(selector.label), preventChangeTrigger);
                    } else {
                        module.remove.activeItem();
                        module.remove.selectedItem();
                        module.remove.filteredItem();
                    }
                    module.set.placeholderText();
                    module.clearValue(preventChangeTrigger);
                },

                clearValue: function (preventChangeTrigger) {
                    module.set.value('', null, null, preventChangeTrigger);
                },

                clearCache: function () {
                    module.debug('Clearing API cache once');
                    tempDisableApiCache = true;
                },

                scrollPage: function (direction, $selectedItem) {
                    let $currentItem = $selectedItem || module.get.selectedItem();
                    let $menu = $currentItem.closest(selector.menu);
                    let menuHeight = $menu.outerHeight();
                    let currentScroll = $menu.scrollTop();
                    let itemHeight = $item.eq(0).outerHeight();
                    let itemsPerPage = Math.floor(menuHeight / itemHeight);
                    let newScroll = direction === 'up'
                        ? currentScroll - (itemHeight * itemsPerPage)
                        : currentScroll + (itemHeight * itemsPerPage);
                    let $selectableItem = $item.not(selector.unselectable);
                    let isWithinRange;
                    let $nextSelectedItem;
                    let elementIndex;
                    elementIndex = direction === 'up'
                        ? $selectableItem.index($currentItem) - itemsPerPage
                        : $selectableItem.index($currentItem) + itemsPerPage;
                    isWithinRange = direction === 'up'
                        ? elementIndex >= 0
                        : elementIndex < $selectableItem.length;
                    $nextSelectedItem = isWithinRange
                        ? $selectableItem.eq(elementIndex)
                        : (direction === 'up'
                            ? $selectableItem.first()
                            : $selectableItem.last());
                    if ($nextSelectedItem.length > 0) {
                        module.debug('Scrolling page', direction, $nextSelectedItem);
                        $currentItem
                            .removeClass(className.selected);
                        $nextSelectedItem
                            .addClass(className.selected);
                        if (settings.selectOnKeydown && module.is.single() && !$nextSelectedItem.hasClass(className.actionable)) {
                            module.set.selectedItem($nextSelectedItem);
                        }
                        $menu
                            .scrollTop(newScroll);
                    }
                },

                set: {
                    filtered: function () {
                        let isMultiple = module.is.multiple();
                        let isSearch = module.is.searchSelection();
                        let isSearchMultiple = isMultiple && isSearch;
                        let searchValue = isSearch
                            ? module.get.query()
                            : '';
                        let hasSearchValue = typeof searchValue === 'string' && searchValue.length > 0;
                        let searchWidth = module.get.searchWidth();
                        let valueIsSet = searchValue !== '';
                        if (isMultiple && hasSearchValue) {
                            module.verbose('Adjusting input width', searchWidth);
                            $search.css('width', searchWidth + 'px');
                        }
                        if (hasSearchValue || (isSearchMultiple && valueIsSet)) {
                            module.verbose('Hiding placeholder text');
                            $text.addClass(className.filtered);
                        } else if (!isMultiple || (isSearchMultiple && !valueIsSet)) {
                            module.verbose('Showing placeholder text');
                            $text.removeClass(className.filtered);
                        }
                    },
                    empty: function () {
                        $module.addClass(className.empty);
                    },
                    loading: function () {
                        $module.addClass(className.loading);
                    },
                    placeholderText: function (text) {
                        text = text || module.get.placeholderText();
                        module.debug('Setting placeholder text', text);
                        module.set.text(text);
                        $text.addClass(className.placeholder);
                    },
                    tabbable: function () {
                        if (module.is.searchSelection()) {
                            module.debug('Added tabindex to searchable dropdown');
                            $search
                                .val('');
                            module.check.disabled();
                            $menu
                                .attr('tabindex', -1);
                        } else {
                            module.debug('Added tabindex to dropdown');
                            if ($module.attr('tabindex') === undefined) {
                                $module
                                    .attr('tabindex', $input.attr('tabindex') || 0);
                                $menu
                                    .attr('tabindex', -1);
                            }
                        }
                        $input.removeAttr('tabindex');
                    },
                    initialLoad: function () {
                        module.verbose('Setting initial load');
                        initialLoad = true;
                    },
                    activeItem: function ($item) {
                        if (settings.allowAdditions && $item.filter(selector.addition).length > 0) {
                            $item.addClass(className.filtered);
                        } else {
                            $item.addClass(className.active);
                        }
                    },
                    partialSearch: function (text) {
                        let length = module.get.query().length;
                        $search.val(text.slice(0, length));
                    },
                    scrollPosition: function ($item, forceScroll) {
                        let edgeTolerance = 5;
                        let $menu;
                        let hasActive;
                        let offset;
                        let itemOffset;
                        let menuOffset;
                        let menuScroll;
                        let menuHeight;
                        let abovePage;
                        let belowPage;

                        $item = $item || module.get.selectedItem();
                        $menu = $item.closest(selector.menu);
                        hasActive = $item && $item.length > 0;
                        forceScroll = forceScroll !== undefined
                            ? forceScroll
                            : false;
                        if (module.get.activeItem().length === 0) {
                            forceScroll = false;
                        }
                        if ($item && $menu.length > 0 && hasActive) {
                            itemOffset = $item.position().top;

                            $menu.addClass(className.loading);
                            menuScroll = $menu.scrollTop();
                            menuOffset = $menu.offset().top;
                            itemOffset = $item.offset().top;
                            offset = menuScroll - menuOffset + itemOffset;
                            if (!forceScroll) {
                                menuHeight = $menu.height();
                                belowPage = menuScroll + menuHeight < (offset + edgeTolerance);
                                abovePage = (offset - edgeTolerance) < menuScroll;
                            }
                            module.debug('Scrolling to active item', offset);
                            if (forceScroll || abovePage || belowPage) {
                                $menu.scrollTop(offset);
                            }
                            $menu.removeClass(className.loading);
                        }
                    },
                    text: function (text, isNotPlaceholder) {
                        if (settings.action === 'combo') {
                            module.debug('Changing combo button text', text, $combo);
                            if (settings.preserveHTML) {
                                $combo.html(text);
                            } else {
                                $combo.text(text);
                            }
                        } else if (settings.action === 'activate' || isFunction(settings.action)) {
                            if (text !== module.get.placeholderText() || isNotPlaceholder) {
                                $text.removeClass(className.placeholder);
                            }
                            module.debug('Changing text', text, $text);
                            $text
                                .removeClass(className.filtered);
                            if (settings.preserveHTML) {
                                $text.html(text);
                            } else {
                                $text.text(text);
                            }
                        }
                    },
                    selectedItem: function ($item) {
                        let value = module.get.choiceValue($item);
                        let searchText = module.get.choiceText($item, false);
                        let text = module.get.choiceText($item);
                        module.debug('Setting user selection to item', $item);
                        module.remove.activeItem();
                        module.set.partialSearch(searchText);
                        module.set.activeItem($item);
                        module.set.selected(value, $item);
                        module.set.text(text);
                    },
                    selectedLetter: function (letter) {
                        let $selectedItem = $item.filter('.' + className.selected);
                        let alreadySelectedLetter = $selectedItem.length > 0 && module.has.firstLetter($selectedItem, letter);
                        let $nextValue = false;
                        let $nextItem;
                        // check next of the same letter
                        if (alreadySelectedLetter) {
                            $nextItem = $selectedItem.nextAll($item).eq(0);
                            if (module.has.firstLetter($nextItem, letter)) {
                                $nextValue = $nextItem;
                            }
                        }
                        // check all values
                        if (!$nextValue) {
                            $item
                                .each(function () {
                                    if (module.has.firstLetter($(this), letter)) {
                                        $nextValue = $(this);

                                        return false;
                                    }
                                });
                        }
                        // set the next value
                        if ($nextValue) {
                            module.verbose('Scrolling to next value with letter', letter);
                            module.set.scrollPosition($nextValue);
                            $selectedItem.removeClass(className.selected);
                            $nextValue.addClass(className.selected);
                            if (settings.selectOnKeydown && module.is.single() && (!$nextItem || !$nextItem.hasClass(className.actionable))) {
                                module.set.selectedItem($nextValue);
                            }
                        }
                    },
                    direction: function ($menu) {
                        if (settings.direction === 'auto') {
                            // reset position, remove upward if it's base menu
                            if (!$menu) {
                                module.remove.upward();
                            } else if (module.is.upward($menu)) {
                                // we need to make sure when make assertion openDownward for $menu, $menu does not have upward class
                                module.remove.upward($menu);
                            }

                            if (module.can.openDownward($menu)) {
                                module.remove.upward($menu);
                            } else {
                                module.set.upward($menu);
                            }
                            if (!module.is.leftward($menu) && !module.can.openRightward($menu)) {
                                module.set.leftward($menu);
                            }
                        } else if (settings.direction === 'upward') {
                            module.set.upward($menu);
                        }
                    },
                    upward: function ($currentMenu) {
                        let $element = $currentMenu || $module;
                        $element.addClass(className.upward);
                    },
                    leftward: function ($currentMenu) {
                        let $element = $currentMenu || $menu;
                        $element.addClass(className.leftward);
                    },
                    value: function (value, text, $selected, preventChangeTrigger) {
                        if (typeof text === 'boolean') {
                            preventChangeTrigger = text;
                            $selected = undefined;
                            text = undefined;
                        }
                        if (value !== undefined && value !== '' && !(Array.isArray(value) && value.length === 0)) {
                            $input.removeClass(className.noselection);
                        } else {
                            $input.addClass(className.noselection);
                        }
                        let hasInput = $input.length > 0;
                        let currentValue = module.get.values();
                        let stringValue = value !== undefined
                            ? String(value)
                            : value;
                        if (hasInput) {
                            if (!settings.allowReselection && stringValue == currentValue) {
                                module.verbose('Skipping value update already same value', value, currentValue);
                                if (!module.is.initialLoad()) {
                                    return;
                                }
                            }

                            if (module.is.single() && module.has.selectInput() && module.can.extendSelect()) {
                                module.debug('Adding user option', value);
                                module.add.optionValue(value);
                            }
                            module.debug('Updating input value', value, currentValue);
                            internalChange = true;
                            $input
                                .val(value);
                            if (settings.fireOnInit === false && module.is.initialLoad()) {
                                module.debug('Input native change event ignored on initial load');
                            } else if (preventChangeTrigger !== true) {
                                module.trigger.change();
                            }
                            internalChange = false;
                        } else {
                            module.verbose('Storing value in metadata', value, $input);
                            if (value !== currentValue) {
                                $module.data(metadata.value, stringValue);
                            }
                        }
                        if (settings.fireOnInit === false && module.is.initialLoad()) {
                            module.verbose('No callback on initial load', settings.onChange);
                        } else if (preventChangeTrigger !== true) {
                            settings.onChange.call(element, value, text, $selected);
                        }
                    },
                    active: function () {
                        $module
                            .addClass(className.active);
                    },
                    multiple: function () {
                        $module.addClass(className.multiple);
                    },
                    visible: function () {
                        $module.addClass(className.visible);
                    },
                    exactly: function (value, $selectedItem, preventChangeTrigger) {
                        if (typeof $selectedItem === 'boolean') {
                            preventChangeTrigger = $selectedItem;
                            $selectedItem = undefined;
                        }
                        module.debug('Setting selected to exact values');
                        module.clear();
                        module.set.selected(value, $selectedItem, preventChangeTrigger);
                    },
                    selected: function (value, $selectedItem, preventChangeTrigger, keepSearchTerm) {
                        if (typeof $selectedItem === 'boolean') {
                            keepSearchTerm = preventChangeTrigger;
                            preventChangeTrigger = $selectedItem;
                            $selectedItem = undefined;
                        }
                        let isMultiple = module.is.multiple();
                        $selectedItem = settings.allowAdditions
                            ? $selectedItem || module.get.itemWithAdditions(value)
                            : $selectedItem || module.get.item(value);
                        if (!$selectedItem && value !== undefined) {
                            return false;
                        }
                        if (isMultiple) {
                            if (!keepSearchTerm) {
                                module.remove.searchWidth();
                            }
                            if (settings.useLabels) {
                                module.remove.selectedItem();
                                if (value === undefined) {
                                    module.remove.labels($module.find(selector.label), true);
                                }
                            }
                        } else {
                            module.remove.activeItem();
                            module.remove.selectedItem();
                        }
                        if (!$selectedItem) {
                            return false;
                        }
                        module.debug('Setting selected menu item to', $selectedItem);
                        // select each item
                        $selectedItem
                            .each(function () {
                                let $selected = $(this);
                                let selectedText = module.get.choiceText($selected);
                                let selectedValue = module.get.choiceValue($selected, selectedText);

                                let isFiltered = $selected.hasClass(className.filtered);
                                let isActive = $selected.hasClass(className.active);
                                let isActionable = $selected.hasClass(className.actionable);
                                let isUserValue = $selected.hasClass(className.addition);
                                let shouldAnimate = isMultiple && $selectedItem && $selectedItem.length === 1;
                                if (isActionable) {
                                    if ((!isMultiple || (!isActive || isUserValue)) && settings.apiSettings && settings.saveRemoteData) {
                                        module.save.remoteData(selectedText, selectedValue);
                                    }
                                    settings.onActionable.call(element, selectedValue, selectedText, $selected);
                                } else if (isMultiple) {
                                    if (!isActive || isUserValue) {
                                        if (settings.apiSettings && settings.saveRemoteData) {
                                            module.save.remoteData(selectedText, selectedValue);
                                        }
                                        if (settings.useLabels) {
                                            module.add.label(selectedValue, selectedText, shouldAnimate);
                                            module.add.value(selectedValue, selectedText, $selected, preventChangeTrigger);
                                            module.set.activeItem($selected);
                                            module.filterActive();
                                            module.select.nextAvailable($selectedItem);
                                        } else {
                                            module.add.value(selectedValue, selectedText, $selected, preventChangeTrigger);
                                            module.set.text(module.add.variables(message.count));
                                            module.set.activeItem($selected);
                                        }
                                    } else if (!isFiltered && (settings.useLabels || selectActionActive)) {
                                        module.debug('Selected active value, removing label');
                                        module.remove.selected(selectedValue);
                                    }
                                } else {
                                    if (settings.apiSettings && settings.saveRemoteData) {
                                        module.save.remoteData(selectedText, selectedValue);
                                    }
                                    if (!keepSearchTerm && !$selected.hasClass(className.actionable)) {
                                        module.set.text(selectedText, true);
                                    }
                                    module.set.value(selectedValue, selectedText, $selected, preventChangeTrigger);
                                    $selected
                                        .addClass(className.active)
                                        .addClass(className.selected);
                                }
                            });
                        if (!keepSearchTerm) {
                            module.remove.searchTerm();
                        }
                        if (module.is.allFiltered()) {
                            module.set.empty();
                            module.hideMenu();
                        }
                    },
                },

                add: {
                    label: function (value, text, shouldAnimate) {
                        let $next = module.is.searchSelection()
                            ? $search
                            : $text;
                        let $label;
                        if (settings.ignoreCase) {
                            value = value.toLowerCase();
                        }
                        $label = $('<a />')
                            .addClass(className.label)
                            .attr('data-' + metadata.value, value)
                            .html(templates.label(value, text, settings));
                        $label = settings.onLabelCreate.call($label, value, text);

                        if (module.has.label(value)) {
                            module.debug('User selection already exists, skipping', value);

                            return;
                        }
                        if (settings.label.variation) {
                            $label.addClass(settings.label.variation);
                        }
                        if (shouldAnimate === true && settings.label.transition) {
                            module.debug('Animating in label', $label);
                            $label
                                .addClass(className.hidden)
                                .insertBefore($next)
                                .transition({
                                    animation: settings.label.transition,
                                    debug: settings.debug,
                                    verbose: settings.verbose,
                                    silent: settings.silent,
                                    duration: settings.label.duration,
                                });
                        } else {
                            module.debug('Adding selection label', $label);
                            $label
                                .insertBefore($next);
                        }
                    },
                    message: function (message) {
                        let $message = $menu.children(selector.message);
                        let html = settings.templates.message(module.add.variables(message));
                        if ($message.length > 0) {
                            $message
                                .html(html);
                        } else {
                            $('<div/>')
                                .html(html)
                                .addClass(className.message)
                                .appendTo($menu);
                        }
                    },
                    optionValue: function (value) {
                        let $option = $input.find('option[value="' + CSS.escape(value) + '"]');
                        let hasOption = $option.length > 0;
                        if (hasOption) {
                            return;
                        }
                        // temporarily disconnect observer
                        module.disconnect.selectObserver();
                        if (module.is.single()) {
                            module.verbose('Removing previous user addition');
                            $input.find('option.' + className.addition).remove();
                        }
                        $('<option/>')
                            .prop('value', value)
                            .addClass(className.addition)
                            .text(value)
                            .appendTo($input);
                        module.verbose('Adding user addition as an <option>', value);
                        module.observe.select();
                    },
                    userSuggestion: function (value) {
                        let $addition = $menu.children(selector.addition);
                        let $existingItem = module.get.item(value);
                        let alreadyHasValue = $existingItem && $existingItem.not(selector.addition).length > 0;
                        let hasUserSuggestion = $addition.length > 0;
                        let html;
                        if (settings.useLabels && module.has.maxSelections()) {
                            return;
                        }
                        if (value === '' || alreadyHasValue) {
                            $addition.remove();

                            return;
                        }
                        if (hasUserSuggestion) {
                            $addition
                                .data(metadata.value, value)
                                .data(metadata.text, value)
                                .attr('data-' + metadata.value, value)
                                .attr('data-' + metadata.text, value)
                                .removeClass(className.filtered);
                            if (!settings.hideAdditions) {
                                html = settings.templates.addition(module.add.variables(message.addResult, settings.templates.escape(value, settings)));
                                $addition
                                    .html(html);
                            }
                            module.verbose('Replacing user suggestion with new value', $addition);
                        } else {
                            $addition = module.create.userChoice(value);
                            $addition
                                .prependTo($menu);
                            module.verbose('Adding item choice to menu corresponding with user choice addition', $addition);
                        }
                        if (!settings.hideAdditions || module.is.allFiltered()) {
                            $addition
                                .addClass(className.selected)
                                .siblings()
                                .removeClass(className.selected);
                        }
                        module.refreshItems();
                    },
                    variables: function (message, term) {
                        let hasCount = message.search('{count}') !== -1;
                        let hasMaxCount = message.search('{maxCount}') !== -1;
                        let hasTerm = message.search('{term}') !== -1;
                        let query;
                        module.verbose('Adding templated variables to message', message);
                        if (hasCount) {
                            message = message.replace('{count}', module.get.selectionCount());
                        }
                        if (hasMaxCount) {
                            message = message.replace('{maxCount}', settings.maxSelections);
                        }
                        if (hasTerm) {
                            query = term || module.get.query();
                            message = message.replace('{term}', query);
                        }

                        return message;
                    },
                    value: function (addedValue, addedText, $selectedItem, preventChangeTrigger) {
                        if (typeof addedText === 'boolean') {
                            preventChangeTrigger = addedText;
                            $selectedItem = undefined;
                            addedText = undefined;
                        }
                        let currentValue = module.get.values();
                        let newValue;
                        if (module.has.value(addedValue)) {
                            module.debug('Value already selected');

                            return;
                        }
                        if (addedValue === '') {
                            module.debug('Cannot select blank values from multiselect');

                            return;
                        }
                        // extend current array
                        if (Array.isArray(currentValue)) {
                            newValue = $selectedItem && $selectedItem.hasClass(className.actionable)
                                ? currentValue
                                : currentValue.concat([addedValue]);
                            newValue = module.get.uniqueArray(newValue);
                        } else {
                            newValue = [addedValue];
                        }
                        // add values
                        if (module.has.selectInput()) {
                            if (module.can.extendSelect()) {
                                module.debug('Adding value to select', addedValue, newValue, $input);
                                module.add.optionValue(addedValue);
                            }
                        } else {
                            newValue = newValue.join(settings.delimiter);
                            module.debug('Setting hidden input to delimited value', newValue, $input);
                        }

                        if (settings.fireOnInit === false && module.is.initialLoad()) {
                            module.verbose('Skipping onadd callback on initial load', settings.onAdd);
                        } else {
                            settings.onAdd.call(element, addedValue, addedText, $selectedItem);
                        }
                        module.set.value(newValue, addedText, $selectedItem, preventChangeTrigger);
                        module.check.maxSelections();
                    },
                },

                remove: {
                    active: function () {
                        $module.removeClass(className.active);
                    },
                    activeLabel: function () {
                        $module.find(selector.label).removeClass(className.active);
                    },
                    empty: function () {
                        $module.removeClass(className.empty);
                    },
                    loading: function () {
                        $module.removeClass(className.loading);
                    },
                    initialLoad: function () {
                        initialLoad = false;
                    },
                    upward: function ($currentMenu) {
                        let $element = $currentMenu || $module;
                        $element.removeClass(className.upward);
                    },
                    leftward: function ($currentMenu) {
                        let $element = $currentMenu || $menu;
                        $element.removeClass(className.leftward);
                    },
                    visible: function () {
                        $module.removeClass(className.visible);
                    },
                    activeItem: function () {
                        $item.removeClass(className.active);
                    },
                    filteredItem: function () {
                        if (settings.highlightMatches) {
                            $.each($item, function (index, item) {
                                let $markItem = $(item);
                                $markItem.html($markItem.html().replace(/<\/?mark>/g, ''));
                            });
                        }
                        if (settings.useLabels && module.has.maxSelections()) {
                            return;
                        }
                        if (settings.useLabels && module.is.multiple()) {
                            $item.not('.' + className.active).removeClass(className.filtered);
                        } else {
                            $item.removeClass(className.filtered);
                        }
                        if (settings.hideDividers) {
                            $divider.removeClass(className.hidden);
                        }
                        module.remove.empty();
                    },
                    optionValue: function (value) {
                        let $option = $input.find('option[value="' + CSS.escape(value) + '"]');
                        let hasOption = $option.length > 0;
                        if (!hasOption || !$option.hasClass(className.addition)) {
                            return;
                        }
                        // temporarily disconnect observer
                        module.disconnect.selectObserver();
                        $option.remove();
                        module.verbose('Removing user addition as an <option>', value);
                        module.observe.select();
                    },
                    message: function () {
                        $menu.children(selector.message).remove();
                    },
                    searchWidth: function () {
                        $search.css('width', '');
                    },
                    searchTerm: function () {
                        module.verbose('Cleared search term');
                        $search.val('');
                        module.set.filtered();
                    },
                    userAddition: function () {
                        $item.filter(selector.addition).remove();
                    },
                    selected: function (value, $selectedItem, preventChangeTrigger) {
                        $selectedItem = settings.allowAdditions
                            ? $selectedItem || module.get.itemWithAdditions(value)
                            : $selectedItem || module.get.item(value);

                        if (!$selectedItem) {
                            return false;
                        }

                        $selectedItem
                            .each(function () {
                                let $selected = $(this);
                                let selectedText = module.get.choiceText($selected);
                                let selectedValue = module.get.choiceValue($selected, selectedText);
                                if (module.is.multiple()) {
                                    if (settings.useLabels) {
                                        module.remove.value(selectedValue, selectedText, $selected, preventChangeTrigger);
                                        module.remove.label(selectedValue);
                                    } else {
                                        module.remove.value(selectedValue, selectedText, $selected, preventChangeTrigger);
                                        if (module.get.selectionCount() === 0) {
                                            module.set.placeholderText();
                                        } else {
                                            module.set.text(module.add.variables(message.count));
                                        }
                                    }
                                } else {
                                    module.remove.value(selectedValue, selectedText, $selected, preventChangeTrigger);
                                }
                                $selected
                                    .removeClass(className.filtered)
                                    .removeClass(className.active);
                                if (settings.useLabels) {
                                    $selected.removeClass(className.selected);
                                }
                            });
                    },
                    selectedItem: function () {
                        $item.removeClass(className.selected);
                    },
                    value: function (removedValue, removedText, $removedItem, preventChangeTrigger) {
                        let values = module.get.values();
                        let newValue;
                        if (module.has.selectInput()) {
                            module.verbose('Input is <select> removing selected option', removedValue);
                            newValue = module.remove.arrayValue(removedValue, values);
                            module.remove.optionValue(removedValue);
                        } else {
                            module.verbose('Removing from delimited values', removedValue);
                            newValue = module.remove.arrayValue(removedValue, values);
                            newValue = newValue.join(settings.delimiter);
                        }
                        if (settings.fireOnInit === false && module.is.initialLoad()) {
                            module.verbose('No callback on initial load', settings.onRemove);
                        } else {
                            settings.onRemove.call(element, removedValue, removedText, $removedItem);
                        }
                        module.set.value(newValue, removedText, $removedItem, preventChangeTrigger);
                        module.check.maxSelections();
                    },
                    arrayValue: function (removedValue, values) {
                        if (!Array.isArray(values)) {
                            values = [values];
                        }
                        values = $.grep(values, function (value) {
                            return removedValue != value;
                        });
                        module.verbose('Removed value from delimited string', removedValue, values);

                        return values;
                    },
                    label: function (value, shouldAnimate) {
                        let $labels = $module.find(selector.label);
                        let $removedLabel = $labels.filter('[data-' + metadata.value + '="' + CSS.escape(settings.ignoreCase ? value.toLowerCase() : value) + '"]');
                        module.verbose('Removing label', $removedLabel);
                        $removedLabel.remove();
                    },
                    activeLabels: function ($activeLabels) {
                        $activeLabels = $activeLabels || $module.find(selector.label).filter('.' + className.active);
                        module.verbose('Removing active label selections', $activeLabels);
                        module.remove.labels($activeLabels);
                    },
                    labels: function ($labels, preventChangeTrigger) {
                        $labels = $labels || $module.find(selector.label);
                        module.verbose('Removing labels', $labels);
                        $labels
                            .each(function () {
                                let $label = $(this);
                                let value = $label.data(metadata.value);
                                let stringValue = value !== undefined
                                    ? String(value)
                                    : value;
                                let isUserValue = module.is.userValue(stringValue);
                                if (settings.onLabelRemove.call($label, value) === false) {
                                    module.debug('Label remove callback cancelled removal');

                                    return;
                                }
                                module.remove.message();
                                if (isUserValue) {
                                    module.remove.value(stringValue, stringValue, module.get.item(stringValue), preventChangeTrigger);
                                    module.remove.label(stringValue);
                                } else {
                                    // selected will also remove label
                                    module.remove.selected(stringValue, false, preventChangeTrigger);
                                }
                            });
                    },
                    tabbable: function () {
                        if (module.is.searchSelection()) {
                            module.debug('Searchable dropdown initialized');
                            $search
                                .removeAttr('tabindex');
                            $menu
                                .removeAttr('tabindex');
                        } else {
                            module.debug('Simple selection dropdown initialized');
                            $module
                                .removeAttr('tabindex');
                            $menu
                                .removeAttr('tabindex');
                        }
                    },
                    diacritics: function (text) {
                        return settings.ignoreDiacritics ? text.normalize('NFD').replace(/[\u0300-\u036F]/g, '') : text;
                    },
                },

                has: {
                    menuSearch: function () {
                        return module.has.search() && $search.closest($menu).length > 0;
                    },
                    clearItem: function () {
                        return $clear.length > 0;
                    },
                    search: function () {
                        return $search.length > 0;
                    },
                    sizer: function () {
                        return $sizer.length > 0;
                    },
                    selectInput: function () {
                        return $input.is('select');
                    },
                    minCharacters: function (searchTerm) {
                        if (settings.minCharacters && !iconClicked) {
                            searchTerm = searchTerm !== undefined
                                ? String(searchTerm)
                                : String(module.get.query());

                            return searchTerm.length >= settings.minCharacters;
                        }
                        iconClicked = false;

                        return true;
                    },
                    firstLetter: function ($item, letter) {
                        let text;
                        let firstLetter;
                        if (!$item || $item.length === 0 || typeof letter !== 'string') {
                            return false;
                        }
                        text = module.get.choiceText($item, false);
                        letter = letter.toLowerCase();
                        firstLetter = String(text).charAt(0).toLowerCase();

                        return letter == firstLetter;
                    },
                    input: function () {
                        return $input.length > 0;
                    },
                    items: function () {
                        return $item.length > 0;
                    },
                    menu: function () {
                        return $menu.length > 0;
                    },
                    subMenu: function ($currentMenu) {
                        return ($currentMenu || $menu).find(selector.menu).length > 0;
                    },
                    message: function () {
                        return $menu.children(selector.message).length > 0;
                    },
                    label: function (value) {
                        let $labels = $module.find(selector.label);
                        if (settings.ignoreCase) {
                            value = value.toLowerCase();
                        }

                        return $labels.filter('[data-' + metadata.value + '="' + CSS.escape(value) + '"]').length > 0;
                    },
                    maxSelections: function () {
                        return settings.maxSelections && module.get.selectionCount() >= settings.maxSelections;
                    },
                    allResultsFiltered: function () {
                        let $normalResults = $item.not(selector.addition);

                        return $normalResults.filter(selector.unselectable).length === $normalResults.length;
                    },
                    userSuggestion: function () {
                        return $menu.children(selector.addition).length > 0;
                    },
                    query: function () {
                        return module.get.query() !== '';
                    },
                    value: function (value) {
                        return settings.ignoreCase
                            ? module.has.valueIgnoringCase(value)
                            : module.has.valueMatchingCase(value);
                    },
                    valueMatchingCase: function (value) {
                        let values = module.get.values();
                        let hasValue = Array.isArray(values)
                            ? values && ($.inArray(value, values) !== -1)
                            : values == value;

                        return !!hasValue;
                    },
                    valueIgnoringCase: function (value) {
                        let values = module.get.values();
                        let hasValue = false;
                        if (!Array.isArray(values)) {
                            values = [values];
                        }
                        $.each(values, function (index, existingValue) {
                            if (String(value).toLowerCase() === String(existingValue).toLowerCase()) {
                                hasValue = true;

                                return false;
                            }
                        });

                        return hasValue;
                    },
                },

                is: {
                    active: function () {
                        return $module.hasClass(className.active);
                    },
                    animatingInward: function () {
                        return $menu.transition('is inward');
                    },
                    animatingOutward: function () {
                        return $menu.transition('is outward');
                    },
                    bubbledLabelClick: function (event) {
                        return $(event.target).is('select, input') && $module.closest('label').length > 0;
                    },
                    bubbledIconClick: function (event) {
                        return $(event.target).closest($icon).length > 0;
                    },
                    empty: function () {
                        return $module.hasClass(className.empty);
                    },
                    chrome: function () {
                        return !!window.chrome && !window.StyleMedia;
                    },
                    alreadySetup: function () {
                        return $module.is('select') && $module.parent(selector.dropdown).data(moduleNamespace) !== undefined && $module.prev().length === 0;
                    },
                    animating: function ($subMenu) {
                        return $subMenu
                            ? $subMenu.transition && $subMenu.transition('is animating')
                            : $menu.transition && $menu.transition('is animating');
                    },
                    leftward: function ($subMenu) {
                        let $selectedMenu = $subMenu || $menu;

                        return $selectedMenu.hasClass(className.leftward);
                    },
                    clearable: function () {
                        let hasClearableClass = $module.hasClass(className.clearable);
                        if (!hasClearableClass && settings.clearable) {
                            $module.addClass(className.clearable);
                        }

                        return hasClearableClass || settings.clearable;
                    },
                    disabled: function () {
                        return $module.hasClass(className.disabled);
                    },
                    focused: function () {
                        return document.activeElement === $module[0];
                    },
                    focusedOnSearch: function () {
                        return document.activeElement === $search[0];
                    },
                    allFiltered: function () {
                        return (module.is.multiple() || module.has.search()) && !(!settings.hideAdditions && module.has.userSuggestion()) && !module.has.message() && module.has.allResultsFiltered();
                    },
                    hidden: function ($subMenu) {
                        return !module.is.visible($subMenu);
                    },
                    initialLoad: function () {
                        return initialLoad;
                    },
                    inObject: function (needle, object) {
                        let found = false;
                        $.each(object, function (index, property) {
                            if (property == needle) {
                                found = true;

                                return true;
                            }
                        });

                        return found;
                    },
                    multiple: function () {
                        return $module.hasClass(className.multiple);
                    },
                    remote: function () {
                        return settings.apiSettings && module.can.useAPI();
                    },
                    noApiCache: function () {
                        return tempDisableApiCache || (settings.apiSettings && !settings.apiSettings.cache);
                    },
                    single: function () {
                        return !module.is.multiple();
                    },
                    selectMutation: function (mutations) {
                        let selectChanged = false;
                        $.each(mutations, function (index, mutation) {
                            if ($(mutation.target).is('option, optgroup') || $(mutation.addedNodes).is('select') || ($(mutation.target).is('select') && mutation.type !== 'attributes')) {
                                selectChanged = true;

                                return false;
                            }
                        });

                        return selectChanged;
                    },
                    search: function () {
                        return $module.hasClass(className.search);
                    },
                    searchSelection: function (deep) {
                        return module.has.search() && (deep ? $search.parents(selector.dropdown) : $search.parent(selector.dropdown)).length === 1;
                    },
                    selection: function () {
                        return $module.hasClass(className.selection);
                    },
                    userValue: function (value) {
                        return $.inArray(value, module.get.userValues()) !== -1;
                    },
                    upward: function ($menu) {
                        let $element = $menu || $module;

                        return $element.hasClass(className.upward);
                    },
                    visible: function ($subMenu) {
                        return $subMenu
                            ? $subMenu.hasClass(className.visible)
                            : $menu.hasClass(className.visible);
                    },
                    verticallyScrollableContext: function () {
                        let overflowY = $context[0] !== window
                            ? $context.css('overflow-y')
                            : false;

                        return overflowY === 'auto' || overflowY === 'scroll';
                    },
                    horizontallyScrollableContext: function () {
                        let overflowX = $context[0] !== window
                            ? $context.css('overflow-X')
                            : false;

                        return overflowX === 'auto' || overflowX === 'scroll';
                    },
                },

                can: {
                    activate: function ($item) {
                        return (
                            settings.useLabels
                                || !module.has.maxSelections()
                                || (module.has.maxSelections() && $item.hasClass(className.active))
                        );
                    },
                    openDownward: function ($subMenu) {
                        let $currentMenu = $subMenu || $menu;
                        let canOpenDownward;
                        let onScreen;
                        let calculations;
                        $currentMenu
                            .addClass(className.loading);
                        calculations = {
                            context: {
                                offset: $context[0] === window
                                    ? { top: 0, left: 0 }
                                    : $context.offset(),
                                scrollTop: $context.scrollTop(),
                                height: $context.outerHeight(),
                            },
                            menu: {
                                offset: $currentMenu.offset(),
                                height: $currentMenu.outerHeight(),
                            },
                        };
                        if (module.is.verticallyScrollableContext()) {
                            calculations.menu.offset.top += calculations.context.scrollTop;
                        }
                        if (module.has.subMenu($currentMenu)) {
                            calculations.menu.height += $currentMenu.find(selector.menu).first().outerHeight();
                        }
                        onScreen = {
                            above: calculations.context.scrollTop <= calculations.menu.offset.top - calculations.context.offset.top - calculations.menu.height,
                            below: (calculations.context.scrollTop + calculations.context.height) >= calculations.menu.offset.top - calculations.context.offset.top + calculations.menu.height,
                        };
                        if (onScreen.below) {
                            module.verbose('Dropdown can fit in context downward', onScreen);
                            canOpenDownward = true;
                        } else if (!onScreen.below && !onScreen.above) {
                            module.verbose('Dropdown cannot fit in either direction, favoring downward', onScreen);
                            canOpenDownward = true;
                        } else {
                            module.verbose('Dropdown cannot fit below, opening upward', onScreen);
                            canOpenDownward = false;
                        }
                        $currentMenu.removeClass(className.loading);

                        return canOpenDownward;
                    },
                    openRightward: function ($subMenu) {
                        let $currentMenu = $subMenu || $menu;
                        let canOpenRightward = true;
                        let isOffscreenRight = false;
                        let calculations;
                        $currentMenu
                            .addClass(className.loading);
                        calculations = {
                            context: {
                                offset: $context[0] === window
                                    ? { top: 0, left: 0 }
                                    : $context.offset(),
                                scrollLeft: $context.scrollLeft(),
                                width: $context.outerWidth(),
                            },
                            menu: {
                                offset: $currentMenu.offset(),
                                width: $currentMenu.outerWidth(),
                            },
                        };
                        if (module.is.horizontallyScrollableContext()) {
                            calculations.menu.offset.left += calculations.context.scrollLeft;
                        }
                        isOffscreenRight = calculations.menu.offset.left - calculations.context.offset.left + calculations.menu.width >= calculations.context.scrollLeft + calculations.context.width;
                        if (isOffscreenRight) {
                            module.verbose('Dropdown cannot fit in context rightward', isOffscreenRight);
                            canOpenRightward = false;
                        }
                        $currentMenu.removeClass(className.loading);

                        return canOpenRightward;
                    },
                    extendSelect: function () {
                        return settings.allowAdditions || settings.apiSettings;
                    },
                    show: function () {
                        return !module.is.disabled() && (module.has.items() || module.has.message());
                    },
                    useAPI: function () {
                        return $.fn.api !== undefined;
                    },
                    useElement: function (element) {
                        if ($.fn[element] !== undefined) {
                            return true;
                        }
                        module.error(error.noElement.replace('{element}', element));

                        return false;
                    },
                },

                animate: {
                    show: function (callback, $subMenu) {
                        let $currentMenu = $subMenu || $menu;
                        let start = $subMenu
                            ? function () {}
                            : function () {
                                module.hideSubMenus();
                                module.hideOthers();
                                module.set.active();
                            };
                        let transition;
                        callback = isFunction(callback)
                            ? callback
                            : function () {};
                        module.verbose('Doing menu show animation', $currentMenu);
                        module.set.direction($subMenu);
                        transition = settings.transition.showMethod || module.get.transition($subMenu);
                        if (module.is.selection()) {
                            module.set.scrollPosition(module.get.selectedItem(), true);
                        }
                        if (module.is.hidden($currentMenu) || module.is.animating($currentMenu)) {
                            if (transition === 'none') {
                                start();
                                $currentMenu.transition({
                                    displayType: module.get.displayType(),
                                }).transition('show');
                                callback.call(element);
                            } else if (module.can.useElement('transition')) {
                                $currentMenu
                                    .transition({
                                        animation: transition + ' in',
                                        debug: settings.debug,
                                        verbose: settings.verbose,
                                        silent: settings.silent,
                                        duration: settings.transition.showDuration || settings.duration,
                                        queue: true,
                                        onStart: start,
                                        displayType: module.get.displayType(),
                                        onComplete: function () {
                                            callback.call(element);
                                        },
                                    });
                            }
                        }
                    },
                    hide: function (callback, $subMenu) {
                        let $currentMenu = $subMenu || $menu;
                        let start = $subMenu
                            ? function () {}
                            : function () {
                                module.unbind.intent();
                                module.remove.active();
                            };
                        let transition = settings.transition.hideMethod || module.get.transition($subMenu);
                        callback = isFunction(callback)
                            ? callback
                            : function () {};
                        if (module.is.visible($currentMenu) || module.is.animating($currentMenu)) {
                            module.verbose('Doing menu hide animation', $currentMenu);

                            if (transition === 'none') {
                                start();
                                $currentMenu.transition({
                                    displayType: module.get.displayType(),
                                }).transition('hide');
                                callback.call(element);
                            } else if ($.fn.transition !== undefined) {
                                $currentMenu
                                    .transition({
                                        animation: transition + ' out',
                                        duration: settings.transition.hideDuration || settings.duration,
                                        debug: settings.debug,
                                        verbose: settings.verbose,
                                        silent: settings.silent,
                                        queue: false,
                                        onStart: start,
                                        displayType: module.get.displayType(),
                                        onComplete: function () {
                                            callback.call(element);
                                        },
                                    });
                            } else {
                                module.error(error.transition);
                            }
                        }
                    },
                },

                hideAndClear: function () {
                    module.remove.searchTerm();
                    if (module.has.maxSelections()) {
                        return;
                    }
                    if (module.has.search()) {
                        module.hide(function () {
                            module.remove.filteredItem();
                        });
                    } else {
                        module.hide();
                    }
                },

                delay: {
                    show: function () {
                        module.verbose('Delaying show event to ensure user intent');
                        clearTimeout(module.timer);
                        module.timer = setTimeout(function () {
                            module.show();
                        }, settings.delay.show);
                    },
                    hide: function () {
                        module.verbose('Delaying hide event to ensure user intent');
                        clearTimeout(module.timer);
                        module.timer = setTimeout(function () {
                            module.hide();
                        }, settings.delay.hide);
                    },
                },

                escape: {
                    string: function (text) {
                        text = String(text);

                        return text.replace(regExp.escape, '\\$&');
                    },

                    // https://github.com/fomantic/Fomantic-UI/issues/2782
                    // https://jsfiddle.net/3efL7jnt/
                    assumeUnescapedAmpLtGt: function (string) {
                        if (settings.preserveHTML) {
                            return string;
                        }

                        const unescapeMap = {
                            '&amp;': '&',
                            '&lt;': '<',
                            '&gt;': '>',
                        };

                        return string.replace(/&(?:amp|lt|gt);/g, (v) => unescapeMap[v]);
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
            : $allModules;
    };

    $.fn.dropdown.settings = {

        silent: false,
        debug: false,
        verbose: false,
        performance: true,

        on: 'click', // what event should show menu action on item selection
        action: 'activate', // action on item selection (nothing, activate, select, combo, hide, function(){})

        values: false, // specify values to use for dropdown

        clearable: false, // whether the value of the dropdown can be cleared

        apiSettings: false,
        selectOnKeydown: true, // Whether selection should occur automatically when keyboard shortcuts used
        minCharacters: 0, // Minimum characters required to trigger API call

        filterRemoteData: false, // Whether API results should be filtered after being returned for query term
        saveRemoteData: true, // Whether remote name/value pairs should be stored in sessionStorage to allow remote data to be restored on page refresh

        throttle: 200, // How long to wait after last user input to search remotely

        context: window, // Context to use when determining if on screen
        direction: 'auto', // Whether dropdown should always open in one direction
        keepOnScreen: true, // Whether dropdown should check whether it is on screen before showing

        match: 'both', // what to match against with search selection (both, text, or label)
        fullTextSearch: 'exact', // search anywhere in value (set to 'exact' to require exact matches)
        highlightMatches: false, // Whether search result should highlight matching strings
        ignoreDiacritics: false, // match results also if they contain diacritics of the same base character (for example, searching for "a" will also match "á" or "â" or "à", etc...)
        hideDividers: false, // Whether to hide any divider elements (specified in selector.divider) that are sibling to any items when searched (set to true will hide all dividers, set to 'empty' will hide them when they are not followed by a visible item)

        placeholder: 'auto', // whether to convert blank <select> values to the placeholder text
        preserveHTML: false, // preserve HTML when selecting value
        sortSelect: false, // sort selection on init

        forceSelection: false, // force a choice on blur with search selection

        allowAdditions: false, // whether multiple select should allow user added values
        keepSearchTerm: false, // whether the search value should be kept, and the menu stays filtered on item selection
        ignoreCase: false, // whether to consider case sensitivity when creating labels
        ignoreSearchCase: true, // whether to consider case sensitivity when filtering items
        hideAdditions: true, // whether to hide a special message prompting a user, they can enter a value

        maxSelections: false, // When set to a number, limits the number of selections to this count
        useLabels: true, // whether multiple select should filter currently active selections from choices
        delimiter: ',', // when multiselect uses normal <input>, the values will be delimited with this character

        showOnFocus: false, // show the menu on focus
        allowReselection: false, // whether current value should trigger callbacks when reselected
        allowTab: true, // add tabindex to the element
        allowCategorySelection: false, // allow elements with submenus to be selected

        fireOnInit: false, // Whether callbacks should fire when initializing dropdown values

        transition: 'auto', // auto transition will slide down or up based on the direction
        duration: 200, // duration of transition
        displayType: false, // displayType of transition

        headerDivider: true, // whether option headers should have an additional divider line underneath when converted from <select> <optgroup>

        collapseOnActionable: true, // whether the dropdown should collapse upon selection of an actionable item
        collapseOnClearable: false, // whether the dropdown should collapse upon clicking the clearable icon

        // label settings on multi-select
        label: {
            transition: 'scale',
            duration: 200,
            variation: false,
        },

        // delay before event
        delay: {
            hide: 300,
            show: 200,
            search: 20,
        },

        /* Callbacks */
        onChange: function (value, text, $selected) {},
        onAdd: function (value, text, $selected) {},
        onRemove: function (value, text, $selected) {},
        onActionable: function (value, text, $selected) {},
        onSearch: function (searchTerm) {},

        onLabelSelect: function ($selectedLabels) {},
        onLabelCreate: function (value, text) {
            return $(this);
        },
        onLabelRemove: function (value) {
            return true;
        },
        onNoResults: function (searchTerm) {
            return true;
        },
        onShow: function () {},
        onHide: function () {},

        /* Component */
        name: 'Dropdown',
        namespace: 'dropdown',

        message: {
            addResult: 'Add <b>{term}</b>',
            count: '{count} selected',
            maxSelections: 'Max {maxCount} selections',
            noResults: 'No results found.',
            serverError: 'There was an error contacting the server',
        },

        error: {
            action: 'You called a dropdown action that was not defined',
            alreadySetup: 'Once a select has been initialized behaviors must be called on the created ui dropdown',
            labels: 'Allowing user additions currently requires the use of labels.',
            missingMultiple: '<select> requires multiple property to be set to correctly preserve multiple values',
            method: 'The method you called is not defined.',
            noAPI: 'The API module is required to load resources remotely',
            noStorage: 'Saving remote data requires session storage',
            noElement: 'This module requires ui {element}',
        },

        regExp: {
            escape: /[\s#$()*+,.:=?@[\\\]^{|}-]/g,
        },

        metadata: {
            defaultText: 'defaultText',
            defaultValue: 'defaultValue',
            placeholderText: 'placeholder',
            text: 'text',
            value: 'value',
        },

        // property names for the remote query
        fields: {
            remoteValues: 'results', // grouping for api results
            values: 'values', // grouping for all dropdown values
            disabled: 'disabled', // whether value should be disabled
            name: 'name', // the displayed dropdown text
            description: 'description', // displayed dropdown description
            descriptionVertical: 'descriptionVertical', // whether description should be vertical
            value: 'value', // actual dropdown value
            text: 'text', // the displayed text when selected
            data: 'data', // custom data attributes
            type: 'type', // type of dropdown element
            image: 'image', // optional image path
            imageClass: 'imageClass', // optional individual class for image
            alt: 'alt', // optional alt text for image
            icon: 'icon', // optional icon name
            iconClass: 'iconClass', // optional individual class for icon (for example, to use a flag instead)
            class: 'class', // optional individual class for item/header
            divider: 'divider', // optional divider append for group headers
            actionable: 'actionable', // optional actionable item
        },

        keys: {
            backspace: 8,
            deleteKey: 46,
            enter: 13,
            escape: 27,
            pageUp: 33,
            pageDown: 34,
            leftArrow: 37,
            upArrow: 38,
            rightArrow: 39,
            downArrow: 40,
        },

        selector: {
            addition: '.addition',
            divider: '.divider, .header',
            dropdown: '.ui.dropdown',
            hidden: '.hidden',
            icon: '> .dropdown.icon',
            input: '> input[type="hidden"], > select',
            item: '.item',
            label: '> .label',
            remove: '> .label > .delete.icon',
            siblingLabel: '.label',
            menu: '.menu',
            message: '.message',
            menuIcon: '.dropdown.icon',
            search: 'input.search, .menu > .search > input, .menu input.search',
            sizer: '> span.sizer',
            text: '> .text:not(.icon)',
            unselectable: '.disabled, .filtered',
            clearIcon: '> .remove.icon',
        },

        className: {
            active: 'active',
            addition: 'addition',
            animating: 'animating',
            description: 'description',
            descriptionVertical: 'vertical',
            disabled: 'disabled',
            empty: 'empty',
            dropdown: 'ui dropdown',
            filtered: 'filtered',
            hidden: 'hidden transition',
            icon: 'icon',
            image: 'image',
            item: 'item',
            label: 'ui label',
            loading: 'loading',
            menu: 'menu',
            message: 'message',
            multiple: 'multiple',
            placeholder: 'default',
            sizer: 'sizer',
            search: 'search',
            selected: 'selected',
            selection: 'selection',
            text: 'text',
            upward: 'upward',
            leftward: 'left',
            visible: 'visible',
            clearable: 'clearable',
            noselection: 'noselection',
            delete: 'delete',
            header: 'header',
            divider: 'divider',
            groupIcon: '',
            unfilterable: 'unfilterable',
            actionable: 'actionable',
        },

    };

    /* Templates */
    $.fn.dropdown.settings.templates = {
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
        // generates dropdown from select values
        dropdown: function (select, settings) {
            let placeholder = select.placeholder || false;
            let html = '';
            let className = settings.className;
            let escape = settings.templates.escape;
            html += '<i class="dropdown icon"></i>';
            html += placeholder
                ? '<div class="default text">' + escape(placeholder, settings) + '</div>'
                : '<div class="text"></div>';
            html += '<div class="' + escape(className.menu) + '">';
            html += settings.templates.menu(select, settings);
            html += '</div>';

            return html;
        },

        // generates just menu from select
        menu: function (response, settings) {
            let fields = settings.fields;
            let values = response[fields.values] || [];
            let html = '';
            let className = settings.className;
            let escape = settings.templates.escape;
            $.each(values, function (index, option) {
                let itemType = option[fields.type] || 'item';
                let isMenu = itemType.indexOf('menu') !== -1;
                let maybeData = '';
                let dataObject = option[fields.data];
                if (dataObject) {
                    let dataKey;
                    let dataKeyEscaped;
                    for (dataKey in dataObject) {
                        dataKeyEscaped = String(dataKey).replace(/\W/g, '');
                        if (Object.prototype.hasOwnProperty.call(dataObject, dataKey) && ['text', 'value'].indexOf(dataKeyEscaped.toLowerCase()) === -1) {
                            maybeData += ' data-' + dataKeyEscaped + '="' + escape(String(dataObject[dataKey])) + '"';
                        }
                    }
                }
                if (itemType === 'item' || isMenu) {
                    let maybeText = option[fields.text]
                        ? ' data-text="' + escape(option[fields.text]) + '"'
                        : '';
                    let maybeActionable = option[fields.actionable]
                        ? className.actionable + ' '
                        : '';
                    let maybeDisabled = option[fields.disabled]
                        ? className.disabled + ' '
                        : '';
                    let maybeDescriptionVertical = option[fields.descriptionVertical]
                        ? className.descriptionVertical + ' '
                        : '';
                    let hasDescription = escape(option[fields.description] || '', settings) !== '';
                    html += '<div class="' + escape(maybeActionable + maybeDisabled + maybeDescriptionVertical + (option[fields.class] || className.item)) + '" data-value="' + escape(option[fields.value]) + '"' + maybeText + maybeData + '>';
                    if (isMenu) {
                        html += '<i class="' + (itemType.indexOf('left') !== -1 ? 'left' : '') + ' dropdown icon"></i>';
                    }
                    if (option[fields.image]) {
                        html += '<img class="' + escape(option[fields.imageClass] || className.image) + '" src="' + escape(option[fields.image]) + '"' + (option[fields.alt] ? ' alt="' + escape(option[fields.alt]) + '"' : '') + '>';
                    }
                    if (option[fields.icon]) {
                        html += '<i class="' + escape(option[fields.icon] + ' ' + (option[fields.iconClass] || className.icon)) + '"></i>';
                    }
                    if (hasDescription) {
                        html += '<span class="' + escape(className.description) + '">' + escape(option[fields.description] || '', settings) + '</span>';
                        html += !isMenu ? '<span class="' + escape(className.text) + '">' : '';
                    }
                    if (isMenu) {
                        html += '<span class="' + escape(className.text) + '">';
                    }
                    html += escape(option[fields.name] || '', settings);
                    if (isMenu) {
                        html += '</span>';
                        html += '<div class="' + escape(itemType) + '">';
                        html += settings.templates.menu(option, settings);
                        html += '</div>';
                    } else if (hasDescription) {
                        html += '</span>';
                    }
                    html += '</div>';
                } else if (itemType === 'header') {
                    let groupName = option[fields.name] || '';
                    let groupIcon = option[fields.icon] || className.groupIcon;
                    if (groupName !== '' || groupIcon !== '') {
                        html += '<div class="' + escape(option[fields.class] || className.header) + '">';
                        if (groupIcon !== '') {
                            html += '<i class="' + escape(groupIcon + ' ' + (option[fields.iconClass] || className.icon)) + '"></i>';
                        }
                        html += escape(groupName, settings);
                        html += '</div>';
                    }
                    if (option[fields.divider]) {
                        html += '<div class="' + escape(className.divider) + '"></div>';
                    }
                }
            });

            return html;
        },

        // generates label for multiselect
        label: function (value, text, settings) {
            let className = settings.className;
            let escape = settings.templates.escape;

            return escape(text, settings) + '<i class="' + escape(className.delete) + ' icon"></i>';
        },

        // generates messages like "No results"
        message: function (message) {
            return message;
        },

        // generates user addition to the selection menu
        addition: function (choice) {
            return choice;
        },

    };
})(jQuery, window, document);
