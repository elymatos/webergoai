/*!
 * # Fomantic-UI - Search
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

    $.fn.search = function (parameters) {
        let $allModules = $(this);

        let time = Date.now();
        let performance = [];

        let query = arguments[0];
        let methodInvoked = typeof query === 'string';
        let queryArguments = [].slice.call(arguments, 1);
        let returnedValue;
        $allModules.each(function () {
            let settings = $.isPlainObject(parameters)
                ? $.extend(true, {}, $.fn.search.settings, parameters)
                : $.extend({}, $.fn.search.settings);

            let className = settings.className;
            let metadata = settings.metadata;
            let regExp = settings.regExp;
            let fields = settings.fields;
            let selector = settings.selector;
            let error = settings.error;
            let namespace = settings.namespace;

            let eventNamespace = '.' + namespace;
            let moduleNamespace = namespace + '-module';

            let $module = $(this);
            let $prompt = $module.find(selector.prompt);
            let $searchButton = $module.find(selector.searchButton);
            let $results = $module.find(selector.results);
            let $result = $module.find(selector.result);
            let $category = $module.find(selector.category);

            let element = this;
            let instance = $module.data(moduleNamespace);

            let disabledBubbled = false;
            let resultsDismissed = false;

            let module;

            module = {

                initialize: function () {
                    module.verbose('Initializing module');
                    module.get.settings();
                    module.determine.searchFields();
                    module.bind.events();
                    module.set.type();
                    module.create.results();
                    module.instantiate();
                },
                instantiate: function () {
                    module.verbose('Storing instance of module', module);
                    instance = module;
                    $module
                        .data(moduleNamespace, module);
                },
                destroy: function () {
                    module.verbose('Destroying instance');
                    $module
                        .off(eventNamespace)
                        .removeData(moduleNamespace);
                },

                refresh: function () {
                    module.debug('Refreshing selector cache');
                    $prompt = $module.find(selector.prompt);
                    $searchButton = $module.find(selector.searchButton);
                    $category = $module.find(selector.category);
                    $results = $module.find(selector.results);
                    $result = $module.find(selector.result);
                },

                refreshResults: function () {
                    $results = $module.find(selector.results);
                    $result = $module.find(selector.result);
                },

                bind: {
                    events: function () {
                        module.verbose('Binding events to search');
                        if (settings.automatic) {
                            $module
                                .on(module.get.inputEvent() + eventNamespace, selector.prompt, module.event.input);
                            $prompt
                                .attr('autocomplete', module.is.chrome() ? 'fomantic-search' : 'off');
                        }
                        $module
                            // prompt
                            .on('focus' + eventNamespace, selector.prompt, module.event.focus)
                            .on('blur' + eventNamespace, selector.prompt, module.event.blur)
                            .on('keydown' + eventNamespace, selector.prompt, module.handleKeyboard)
                            // search button
                            .on('click' + eventNamespace, selector.searchButton, module.query)
                            // results
                            .on('mousedown' + eventNamespace, selector.results, module.event.result.mousedown)
                            .on('mouseup' + eventNamespace, selector.results, module.event.result.mouseup)
                            .on('click' + eventNamespace, selector.result, module.event.result.click)
                            .on('click' + eventNamespace, selector.remove, module.event.remove.click);
                    },
                },

                determine: {
                    searchFields: function () {
                        // this makes sure $.extend does not add specified search fields to default fields
                        // this is the only setting that should not extend defaults
                        if (parameters && parameters.searchFields !== undefined) {
                            settings.searchFields = Array.isArray(parameters.searchFields)
                                ? parameters.searchFields
                                : [parameters.searchFields];
                        }
                    },
                },

                event: {
                    input: function () {
                        if (settings.searchDelay) {
                            clearTimeout(module.timer);
                            module.timer = setTimeout(function () {
                                if (module.is.focused()) {
                                    module.query();
                                }
                            }, settings.searchDelay);
                        } else {
                            module.query();
                        }
                    },
                    focus: function () {
                        module.set.focus();
                        if (settings.searchOnFocus && module.has.minimumCharacters()) {
                            module.query(function () {
                                if (module.can.show()) {
                                    module.showResults();
                                }
                            });
                        }
                    },
                    blur: function (event) {
                        let pageLostFocus = document.activeElement === this;
                        let callback = function () {
                            module.cancel.query();
                            module.remove.focus();
                            module.timer = setTimeout(function () {
                                module.hideResults();
                            }, settings.hideDelay);
                        };
                        if (pageLostFocus) {
                            return;
                        }
                        resultsDismissed = false;
                        if (module.resultsClicked) {
                            module.debug('Determining if user action caused search to close');
                            $module
                                .one('click.close' + eventNamespace, selector.results, function (event) {
                                    if (module.is.inMessage(event) || disabledBubbled) {
                                        $prompt.trigger('focus');

                                        return;
                                    }
                                    disabledBubbled = false;
                                    if (!module.is.animating() && !module.is.hidden()) {
                                        callback();
                                    }
                                });
                        } else {
                            module.debug('Input blurred without user action, closing results');
                            callback();
                        }
                    },
                    remove: {
                        click: function () {
                            module.clear.value();
                            $prompt.trigger('focus');
                        },
                    },
                    result: {
                        mousedown: function () {
                            module.resultsClicked = true;
                        },
                        mouseup: function () {
                            module.resultsClicked = false;
                        },
                        click: function (event) {
                            module.debug('Search result selected');
                            let $result = $(this);
                            let $title = $result.find(selector.title).eq(0);
                            let $link = $result.is('a[href]')
                                ? $result
                                : $result.find('a[href]').eq(0);
                            let href = $link.attr('href') || false;
                            let target = $link.attr('target') || false;
                            // title is used for result lookup
                            let value = $title.length > 0
                                ? $title.text()
                                : false;
                            let results = module.get.results();
                            let result = $result.data(metadata.result) || module.get.result(value, results);
                            let oldValue = module.get.value();
                            if (isFunction(settings.onSelect)) {
                                if (settings.onSelect.call(element, result, results) === false) {
                                    module.debug('Custom onSelect callback cancelled default select action');
                                    disabledBubbled = true;

                                    return;
                                }
                            }
                            module.hideResults();
                            if (value && module.get.value() === oldValue) {
                                module.set.value(value);
                            }
                            if (href) {
                                event.preventDefault();
                                module.verbose('Opening search link found in result', $link);
                                if (target === '_blank' || event.ctrlKey) {
                                    window.open(href);
                                } else {
                                    window.location.href = href;
                                }
                            }
                        },
                    },
                },
                ensureVisible: function ($el) {
                    let elTop;
                    let elBottom;
                    let resultsScrollTop;
                    let resultsHeight;
                    if ($el.length === 0) {
                        return;
                    }
                    elTop = $el.position().top;
                    elBottom = elTop + $el.outerHeight(true);

                    resultsScrollTop = $results.scrollTop();
                    resultsHeight = $results.height();

                    if (elTop < 0) {
                        $results.scrollTop(resultsScrollTop + elTop);
                    } else if (resultsHeight < elBottom) {
                        $results.scrollTop(resultsScrollTop + (elBottom - resultsHeight));
                    }
                },
                handleKeyboard: function (event) {
                    // force selector refresh
                    let $result = $module.find(selector.result);
                    let $category = $module.find(selector.category);
                    let $activeResult = $result.filter('.' + className.active);
                    let currentIndex = $result.index($activeResult);
                    let resultSize = $result.length;
                    let hasActiveResult = $activeResult.length > 0;

                    let keyCode = event.which;
                    let keys = {
                        backspace: 8,
                        enter: 13,
                        escape: 27,
                        upArrow: 38,
                        downArrow: 40,
                    };
                    let newIndex;
                    // search shortcuts
                    if (keyCode === keys.escape) {
                        if (!module.is.visible()) {
                            module.verbose('Escape key pressed, blurring search field');
                            $prompt.trigger('blur');
                        } else {
                            module.hideResults();
                        }
                        event.stopPropagation();
                        resultsDismissed = true;
                    }
                    if (module.is.visible()) {
                        if (keyCode === keys.enter) {
                            module.verbose('Enter key pressed, selecting active result');
                            if ($result.filter('.' + className.active).length > 0) {
                                module.event.result.click.call($result.filter('.' + className.active), event);
                                event.preventDefault();

                                return false;
                            }
                        } else if (keyCode === keys.upArrow && hasActiveResult) {
                            module.verbose('Up key pressed, changing active result');
                            newIndex = currentIndex - 1 < 0
                                ? currentIndex
                                : currentIndex - 1;
                            $category
                                .removeClass(className.active);
                            $result
                                .removeClass(className.active)
                                .eq(newIndex)
                                .addClass(className.active)
                                .closest($category)
                                .addClass(className.active);
                            module.ensureVisible($result.eq(newIndex));
                            event.preventDefault();
                        } else if (keyCode === keys.downArrow) {
                            module.verbose('Down key pressed, changing active result');
                            newIndex = currentIndex + 1 >= resultSize
                                ? currentIndex
                                : currentIndex + 1;
                            $category
                                .removeClass(className.active);
                            $result
                                .removeClass(className.active)
                                .eq(newIndex)
                                .addClass(className.active)
                                .closest($category)
                                .addClass(className.active);
                            module.ensureVisible($result.eq(newIndex));
                            event.preventDefault();
                        }
                    } else {
                        // query shortcuts
                        if (keyCode === keys.enter) {
                            module.verbose('Enter key pressed, executing query');
                            module.query();
                            module.set.buttonPressed();
                            $prompt.one('keyup', module.remove.buttonFocus);
                        }
                    }
                },

                setup: {
                    api: function (searchTerm, callback) {
                        let apiSettings = {
                            debug: settings.debug,
                            on: false,
                            cache: settings.cache,
                            action: 'search',
                            urlData: {
                                query: searchTerm,
                            },
                        };
                        let apiCallbacks = {
                            onSuccess: function (response, $module, xhr) {
                                module.parse.response.call(element, response, searchTerm);
                                callback();
                                if (settings.apiSettings && typeof settings.apiSettings.onSuccess === 'function') {
                                    settings.apiSettings.onSuccess.call(this, response, $module, xhr);
                                }
                            },
                            onFailure: function (response, $module, xhr) {
                                module.displayMessage(error.serverError);
                                callback();
                                if (settings.apiSettings && typeof settings.apiSettings.onFailure === 'function') {
                                    settings.apiSettings.onFailure.call(this, response, $module, xhr);
                                }
                            },
                            onAbort: function (status, $module, xhr) {
                                if (settings.apiSettings && typeof settings.apiSettings.onAbort === 'function') {
                                    settings.apiSettings.onAbort.call(this, status, $module, xhr);
                                }
                            },
                            onError: function (errorMessage, $module, xhr) {
                                module.error();
                                if (settings.apiSettings && typeof settings.apiSettings.onError === 'function') {
                                    settings.apiSettings.onError.call(this, errorMessage, $module, xhr);
                                }
                            },
                        };
                        $.extend(true, apiSettings, settings.apiSettings, apiCallbacks);
                        module.verbose('Setting up API request', apiSettings);
                        $module.api(apiSettings);
                    },
                },

                can: {
                    useAPI: function () {
                        return $.fn.api !== undefined;
                    },
                    show: function () {
                        return module.is.focused() && !module.is.visible() && !module.is.empty();
                    },
                    transition: function () {
                        return settings.transition && $.fn.transition !== undefined;
                    },
                },

                is: {
                    animating: function () {
                        return $results.hasClass(className.animating);
                    },
                    chrome: function () {
                        return !!window.chrome && !window.StyleMedia;
                    },
                    hidden: function () {
                        return $results.hasClass(className.hidden);
                    },
                    inMessage: function (event) {
                        if (!event.target) {
                            return;
                        }
                        let $target = $(event.target);
                        let isInDOM = $.contains(document.documentElement, event.target);

                        return isInDOM && $target.closest(selector.message).length > 0;
                    },
                    empty: function () {
                        return $results.html() === '';
                    },
                    visible: function () {
                        return $results.filter(':visible').length > 0;
                    },
                    focused: function () {
                        return $prompt.filter(':focus').length > 0;
                    },
                },

                get: {
                    settings: function () {
                        if ($.isPlainObject(parameters) && parameters.searchFullText) {
                            settings.fullTextSearch = parameters.searchFullText;
                            module.error(settings.error.oldSearchSyntax, element);
                        }
                    },
                    inputEvent: function () {
                        let prompt = $prompt[0];
                        let inputEvent = prompt !== undefined && prompt.oninput !== undefined
                            ? 'input'
                            : (prompt !== undefined && prompt.onpropertychange !== undefined
                                ? 'propertychange'
                                : 'keyup');

                        return inputEvent;
                    },
                    value: function () {
                        return $prompt.val();
                    },
                    results: function () {
                        return $module.data(metadata.results);
                    },
                    result: function (value, results) {
                        let result = false;
                        value = value !== undefined
                            ? value
                            : module.get.value();
                        results = results !== undefined
                            ? results
                            : module.get.results();
                        if (settings.type === 'category') {
                            module.debug('Finding result that matches', value);
                            $.each(results, function (index, category) {
                                if (Array.isArray(category.results)) {
                                    result = module.search.object(value, category.results)[0];
                                    // don't continue searching if a result is found
                                    if (result) {
                                        return false;
                                    }
                                }
                            });
                        } else {
                            module.debug('Finding result in results object', value);
                            result = module.search.object(value, results)[0];
                        }

                        return result || false;
                    },
                },

                select: {
                    firstResult: function () {
                        module.verbose('Selecting first result');
                        $result.first().addClass(className.active);
                    },
                },

                set: {
                    focus: function () {
                        $module.addClass(className.focus);
                    },
                    loading: function () {
                        $module.addClass(className.loading);
                    },
                    value: function (value) {
                        module.verbose('Setting search input value', value);
                        $prompt
                            .val(value);
                    },
                    type: function (type) {
                        type = type || settings.type;
                        if (className[type]) {
                            $module.addClass(className[type]);
                        }
                    },
                    buttonPressed: function () {
                        $searchButton.addClass(className.pressed);
                    },
                },

                remove: {
                    loading: function () {
                        $module.removeClass(className.loading);
                    },
                    focus: function () {
                        $module.removeClass(className.focus);
                    },
                    buttonPressed: function () {
                        $searchButton.removeClass(className.pressed);
                    },
                    diacritics: function (text) {
                        return settings.ignoreDiacritics ? text.normalize('NFD').replace(/[\u0300-\u036F]/g, '') : text;
                    },
                },

                query: function (callback) {
                    callback = isFunction(callback)
                        ? callback
                        : function () {};
                    let searchTerm = module.get.value();
                    let cache = module.read.cache(searchTerm);
                    callback = callback || function () {};
                    if (module.has.minimumCharacters()) {
                        if (cache) {
                            module.debug('Reading result from cache', searchTerm);
                            module.save.results(cache.results);
                            settings.onResults.call(element, cache.results, true);
                            module.addResults(cache.html);
                            module.inject.id(cache.results);
                            callback();
                        } else {
                            module.debug('Querying for', searchTerm);
                            if ($.isPlainObject(settings.source) || Array.isArray(settings.source)) {
                                module.search.local(searchTerm);
                                callback();
                            } else if (module.can.useAPI()) {
                                module.search.remote(searchTerm, callback);
                            } else {
                                module.error(error.source);
                                callback();
                            }
                        }
                        settings.onSearchQuery.call(element, searchTerm);
                    } else {
                        module.hideResults();
                    }
                },

                search: {
                    local: function (searchTerm) {
                        let results = module.search.object(searchTerm, settings.source);
                        let searchHTML;
                        module.set.loading();
                        module.save.results(results);
                        module.debug('Returned full local search results', results);
                        if (settings.maxResults > 0) {
                            module.debug('Using specified max results', results);
                            results = results.slice(0, settings.maxResults);
                        }
                        if (settings.type === 'category') {
                            results = module.create.categoryResults(results);
                        }
                        searchHTML = module.generateResults({
                            results: results,
                        });
                        module.remove.loading();
                        module.addResults(searchHTML);
                        module.inject.id(results);
                        module.write.cache(searchTerm, {
                            html: searchHTML,
                            results: results,
                        });
                    },
                    remote: function (searchTerm, callback) {
                        callback = isFunction(callback)
                            ? callback
                            : function () {};
                        if ($module.api('is loading')) {
                            $module.api('abort');
                        }
                        module.setup.api(searchTerm, callback);
                        $module
                            .api('query');
                    },
                    object: function (searchTerm, source, searchFields) {
                        searchTerm = module.remove.diacritics(String(searchTerm));
                        let results = [];
                        let exactResults = [];
                        let fuzzyResults = [];
                        let searchExp = searchTerm.replace(regExp.escape, '\\$&');
                        let matchRegExp = new RegExp(regExp.beginsWith + searchExp, settings.ignoreSearchCase ? 'i' : '');

                        // avoid duplicates when pushing results
                        let addResult = function (array, result) {
                            let notResult = $.inArray(result, results) === -1;
                            let notFuzzyResult = $.inArray(result, fuzzyResults) === -1;
                            let notExactResults = $.inArray(result, exactResults) === -1;
                            if (notResult && notFuzzyResult && notExactResults) {
                                array.push(result);
                            }
                        };
                        source = source || settings.source;
                        searchFields = searchFields !== undefined
                            ? searchFields
                            : settings.searchFields;

                        // search fields should be an array to loop correctly
                        if (!Array.isArray(searchFields)) {
                            searchFields = [searchFields];
                        }

                        // exit conditions if no source
                        if (source === undefined || source === false) {
                            module.error(error.source);

                            return [];
                        }
                        // iterate through search fields looking for matches
                        let lastSearchFieldIndex = searchFields.length - 1;
                        $.each(source, function (label, content) {
                            let concatenatedContent = [];
                            $.each(searchFields, function (index, field) {
                                let fieldExists = typeof content[field] === 'string' || typeof content[field] === 'number';
                                if (fieldExists) {
                                    let text;
                                    text = typeof content[field] === 'string'
                                        ? module.remove.diacritics(content[field])
                                        : content[field].toString();
                                    text = $('<div/>', { html: text }).text().trim();
                                    if (settings.fullTextSearch === 'all') {
                                        concatenatedContent.push(text);
                                        if (index < lastSearchFieldIndex) {
                                            return true;
                                        }
                                        text = concatenatedContent.join(' ');
                                    }
                                    if (settings.fullTextSearch !== 'all' && text.search(matchRegExp) !== -1) {
                                        // content starts with value (first in results)
                                        addResult(results, content);
                                    } else if (settings.fullTextSearch === 'exact' && module.exactSearch(searchTerm, text)) {
                                        addResult(exactResults, content);
                                    } else if (settings.fullTextSearch === 'some' && module.wordSearch(searchTerm, text)) {
                                        addResult(exactResults, content);
                                    } else if (settings.fullTextSearch === 'all' && module.wordSearch(searchTerm, text, true)) {
                                        addResult(exactResults, content);
                                    } else if (settings.fullTextSearch === true && module.fuzzySearch(searchTerm, text)) {
                                        // content fuzzy matches (last in results)
                                        addResult(fuzzyResults, content);
                                    }
                                }
                            });
                        });
                        $.merge(exactResults, fuzzyResults);
                        $.merge(results, exactResults);

                        return results;
                    },
                },
                exactSearch: function (query, term) {
                    if (settings.ignoreSearchCase) {
                        query = query.toLowerCase();
                        term = term.toLowerCase();
                    }

                    return term.indexOf(query) > -1;
                },
                wordSearch: function (query, term, matchAll) {
                    let allWords = query.split(/\s+/);
                    let w;
                    let wL = allWords.length;
                    let found = false;
                    for (w = 0; w < wL; w++) {
                        found = module.exactSearch(allWords[w], term);
                        if ((!found && matchAll) || (found && !matchAll)) {
                            break;
                        }
                    }

                    return found;
                },
                fuzzySearch: function (query, term) {
                    let termLength = term.length;
                    let queryLength = query.length;
                    if (typeof query !== 'string') {
                        return false;
                    }
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

                parse: {
                    response: function (response, searchTerm) {
                        if (Array.isArray(response)) {
                            let o = {};
                            o[fields.results] = response;
                            response = o;
                        }
                        let searchHTML = module.generateResults(response);
                        module.verbose('Parsing server response', response);
                        if (response !== undefined) {
                            if (searchTerm !== undefined && response[fields.results] !== undefined) {
                                module.addResults(searchHTML);
                                module.inject.id(response[fields.results]);
                                module.write.cache(searchTerm, {
                                    html: searchHTML,
                                    results: response[fields.results],
                                });
                                module.save.results(response[fields.results]);
                            }
                        }
                    },
                },

                cancel: {
                    query: function () {
                        if (module.can.useAPI()) {
                            $module.api('abort');
                        }
                    },
                },

                has: {
                    minimumCharacters: function () {
                        let searchTerm = module.get.value();
                        let numCharacters = searchTerm.length;

                        return numCharacters >= settings.minCharacters;
                    },
                    results: function () {
                        if ($results.length === 0) {
                            return false;
                        }
                        let html = $results.html();

                        return html !== '';
                    },
                },

                clear: {
                    cache: function (value) {
                        let cache = $module.data(metadata.cache);
                        if (!value) {
                            module.debug('Clearing cache', value);
                            $module.removeData(metadata.cache);
                        } else if (value && cache && cache[value]) {
                            module.debug('Removing value from cache', value);
                            delete cache[value];
                            $module.data(metadata.cache, cache);
                        }
                    },
                    value: function () {
                        module.set.value('');
                    },
                },

                read: {
                    cache: function (name) {
                        let cache = $module.data(metadata.cache);
                        if (settings.cache) {
                            module.verbose('Checking cache for generated html for query', name);

                            return (typeof cache === 'object') && (cache[name] !== undefined)
                                ? cache[name]
                                : false;
                        }

                        return false;
                    },
                },

                create: {
                    categoryResults: function (results) {
                        let categoryResults = {};
                        $.each(results, function (index, result) {
                            if (!result.category) {
                                return;
                            }
                            if (categoryResults[result.category] === undefined) {
                                module.verbose('Creating new category of results', result.category);
                                categoryResults[result.category] = {
                                    name: result.category,
                                    results: [result],
                                };
                            } else {
                                categoryResults[result.category].results.push(result);
                            }
                        });

                        return categoryResults;
                    },
                    id: function (resultIndex, categoryIndex) {
                        let resultID = resultIndex + 1; // not zero indexed
                        let letterID;
                        let id;
                        if (categoryIndex !== undefined) {
                            // start char code for "A"
                            letterID = String.fromCharCode(97 + categoryIndex);
                            id = letterID + resultID;
                            module.verbose('Creating category result id', id);
                        } else {
                            id = resultID;
                            module.verbose('Creating result id', id);
                        }

                        return id;
                    },
                    results: function () {
                        if ($results.length === 0) {
                            $results = $('<div />')
                                .addClass(className.results)
                                .appendTo($module);
                        }
                    },
                },

                inject: {
                    result: function (result, resultIndex, categoryIndex) {
                        module.verbose('Injecting result into results');
                        let $selectedResult = categoryIndex !== undefined
                            ? $results
                                .children().eq(categoryIndex)
                                .children(selector.results)
                                .first()
                                .children(selector.result)
                                .eq(resultIndex)
                            : $results
                                .children(selector.result).eq(resultIndex);
                        module.verbose('Injecting results metadata', $selectedResult);
                        $selectedResult
                            .data(metadata.result, result);
                    },
                    id: function (results) {
                        module.debug('Injecting unique ids into results');
                        // since results may be an object, we must use counters
                        let categoryIndex = 0;
                        let resultIndex = 0;
                        if (settings.type === 'category') {
                            // iterate through each category result
                            $.each(results, function (index, category) {
                                if (category.results.length > 0) {
                                    resultIndex = 0;
                                    $.each(category.results, function (index, result) {
                                        if (result.id === undefined) {
                                            result.id = module.create.id(resultIndex, categoryIndex);
                                        }
                                        module.inject.result(result, resultIndex, categoryIndex);
                                        resultIndex++;
                                    });
                                    categoryIndex++;
                                }
                            });
                        } else {
                            // top level
                            $.each(results, function (index, result) {
                                if (result.id === undefined) {
                                    result.id = module.create.id(resultIndex);
                                }
                                module.inject.result(result, resultIndex);
                                resultIndex++;
                            });
                        }

                        return results;
                    },
                },

                save: {
                    results: function (results) {
                        module.verbose('Saving current search results to metadata', results);
                        $module.data(metadata.results, results);
                    },
                },

                write: {
                    cache: function (name, value) {
                        let cache = $module.data(metadata.cache) !== undefined
                            ? $module.data(metadata.cache)
                            : {};
                        if (settings.cache) {
                            module.verbose('Writing generated html to cache', name, value);
                            cache[name] = value;
                            $module
                                .data(metadata.cache, cache);
                        }
                    },
                },

                addResults: function (html) {
                    if (isFunction(settings.onResultsAdd)) {
                        if (settings.onResultsAdd.call($results, html) === false) {
                            module.debug('onResultsAdd callback cancelled default action');

                            return false;
                        }
                    }
                    if (html) {
                        $results
                            .html(html);
                        module.refreshResults();
                        if (settings.selectFirstResult) {
                            module.select.firstResult();
                        }
                        module.showResults();
                    } else {
                        module.hideResults(function () {
                            $results.empty();
                        });
                    }
                },

                showResults: function (callback) {
                    callback = isFunction(callback)
                        ? callback
                        : function () {};
                    if (resultsDismissed) {
                        return;
                    }
                    if (!module.is.visible() && module.has.results()) {
                        if (module.can.transition()) {
                            module.debug('Showing results with css animations');
                            $results
                                .transition({
                                    animation: settings.transition + ' in',
                                    debug: settings.debug,
                                    verbose: settings.verbose,
                                    silent: settings.silent,
                                    duration: settings.duration,
                                    onShow: function () {
                                        let $firstResult = $module.find(selector.result).eq(0);
                                        module.ensureVisible($firstResult);
                                    },
                                    onComplete: function () {
                                        callback();
                                    },
                                    queue: true,
                                });
                        } else {
                            module.debug('Showing results with javascript');
                            $results
                                .stop()
                                .fadeIn(settings.duration, settings.easing);
                        }
                        settings.onResultsOpen.call($results);
                    }
                },
                hideResults: function (callback) {
                    callback = isFunction(callback)
                        ? callback
                        : function () {};
                    if (module.is.visible()) {
                        if (module.can.transition()) {
                            module.debug('Hiding results with css animations');
                            $results
                                .transition({
                                    animation: settings.transition + ' out',
                                    debug: settings.debug,
                                    verbose: settings.verbose,
                                    silent: settings.silent,
                                    duration: settings.duration,
                                    onComplete: function () {
                                        callback();
                                    },
                                    queue: true,
                                });
                        } else {
                            module.debug('Hiding results with javascript');
                            $results
                                .stop()
                                .fadeOut(settings.duration, settings.easing);
                        }
                        settings.onResultsClose.call($results);
                    }
                },

                generateResults: function (response) {
                    module.debug('Generating html from response', response);
                    let template = settings.templates[settings.type];
                    let isProperObject = $.isPlainObject(response[fields.results]) && !$.isEmptyObject(response[fields.results]);
                    let isProperArray = Array.isArray(response[fields.results]) && response[fields.results].length > 0;
                    let html = '';
                    if (isProperObject || isProperArray) {
                        if (settings.maxResults > 0) {
                            if (isProperObject) {
                                if (settings.type === 'standard') {
                                    module.error(error.maxResults);
                                }
                            } else {
                                response[fields.results] = response[fields.results].slice(0, settings.maxResults);
                            }
                        }
                        if (settings.highlightMatches) {
                            let results = response[fields.results];
                            let regExpIgnore = settings.ignoreSearchCase ? 'i' : '';
                            let querySplit = module.get.value().split('');
                            let diacriticReg = settings.ignoreDiacritics ? '[\u0300-\u036F]?' : '';
                            let htmlReg = '(?![^<]*>)';
                            let markedRegExp = new RegExp(htmlReg + '(' + querySplit.join(diacriticReg + ')(.*?)' + htmlReg + '(') + diacriticReg + ')', regExpIgnore);
                            let markedReplacer = function () {
                                let args = [].slice.call(arguments, 1, querySplit.length * 2).map(function (x, i) {
                                    return i & 1 ? x : '<mark>' + x + '</mark>'; // eslint-disable-line no-bitwise
                                });

                                return args.join('');
                            };
                            $.each(results, function (label, content) {
                                $.each(settings.searchFields, function (index, field) {
                                    let fieldExists = typeof content[field] === 'string' || typeof content[field] === 'number';
                                    if (fieldExists) {
                                        let markedHTML = typeof content[field] === 'string'
                                            ? content[field]
                                            : content[field].toString();
                                        if (settings.ignoreDiacritics) {
                                            markedHTML = markedHTML.normalize('NFD');
                                        }
                                        markedHTML = markedHTML.replace(/<\/?mark>/g, '');
                                        response[fields.results][label][field] = markedHTML.replace(markedRegExp, markedReplacer);
                                    }
                                });
                            });
                        }
                        if (isFunction(template)) {
                            html = template(response, settings);
                        } else {
                            module.error(error.noTemplate, false);
                        }
                    } else if (settings.showNoResults) {
                        html = module.displayMessage(error.noResults, 'empty', error.noResultsHeader);
                    }
                    settings.onResults.call(element, response);

                    return html;
                },

                displayMessage: function (text, type, header) {
                    type = type || 'standard';
                    module.debug('Displaying message', text, type, header);
                    module.addResults(settings.templates.message(text, type, header));

                    return settings.templates.message(text, type, header);
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

    $.fn.search.settings = {

        name: 'Search',
        namespace: 'search',

        silent: false,
        debug: false,
        verbose: false,
        performance: true,

        // template to use (specified in settings.templates)
        type: 'standard',

        // minimum characters required to search
        minCharacters: 1,

        // whether to select the first result after searching automatically
        selectFirstResult: false,

        // API config
        apiSettings: false,

        // object to search
        source: false,

        // Whether search should query current term on focus
        searchOnFocus: true,

        // fields to search
        searchFields: [
            'id',
            'title',
            'description',
        ],

        // field to display in standard results template
        displayField: '',

        // search anywhere in value (set to 'exact' to require exact matches
        fullTextSearch: 'exact',

        // Whether search result should highlight matching strings
        highlightMatches: false,

        // match results also if they contain diacritics of the same base character (for example, searching for "a" will also match "á" or "â" or "à", etc...)
        ignoreDiacritics: false,

        // whether to consider case sensitivity on local searching
        ignoreSearchCase: true,

        // whether to add events to prompt automatically
        automatic: true,

        // delay before hiding the menu after blur
        hideDelay: 0,

        // delay before searching
        searchDelay: 200,

        // maximum results returned from search
        maxResults: 7,

        // whether to store lookups in local cache
        cache: true,

        // whether no results errors should be shown
        showNoResults: true,

        // preserve possible html of resultset values
        preserveHTML: false,

        // transition settings
        transition: 'scale',
        duration: 200,
        easing: 'easeOutExpo',

        // callbacks
        onSelect: false,
        onResultsAdd: false,

        onSearchQuery: function (query) {},
        onResults: function (response, fromCache) {},

        onResultsOpen: function () {},
        onResultsClose: function () {},

        className: {
            animating: 'animating',
            active: 'active',
            category: 'category',
            empty: 'empty',
            focus: 'focus',
            hidden: 'hidden',
            loading: 'loading',
            results: 'results',
            pressed: 'down',
        },

        error: {
            source: 'Cannot search. No source used, and Fomantic API module was not included',
            noResultsHeader: 'No Results',
            noResults: 'Your search returned no results',
            noTemplate: 'A valid template name was not specified.',
            oldSearchSyntax: 'searchFullText setting has been renamed fullTextSearch for consistency, please adjust your settings.',
            serverError: 'There was an issue querying the server.',
            maxResults: 'Results must be an array to use maxResults setting',
            method: 'The method you called is not defined.',
        },

        metadata: {
            cache: 'cache',
            results: 'results',
            result: 'result',
        },

        regExp: {
            escape: /[$()*+./?[\\\]^{|}-]/g,
            beginsWith: '(?:\\s|^)',
        },

        // maps api response attributes to internal representation
        fields: {
            categories: 'results', // array of categories (category view)
            categoryName: 'name', // name of category (category view)
            categoryResults: 'results', // array of results (category view)
            description: 'description', // result description
            image: 'image', // result image
            alt: 'alt', // result alt text for image
            price: 'price', // result price
            results: 'results', // array of results (standard)
            title: 'title', // result title
            url: 'url', // result url
            action: 'action', // "view more" object name
            actionText: 'text', // "view more" text
            actionURL: 'url', // "view more" url
        },

        selector: {
            prompt: '.prompt',
            remove: '> .icon.input > .remove.icon',
            searchButton: '.search.button',
            results: '.results',
            message: '.results > .message',
            category: '.category',
            result: '.result',
            title: '.title, .name',
        },

        templates: {
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

                string = String(string).replace(/["&'<>]/g, (chr) => escapeMap[chr]);

                // FUI controlled HTML is still allowed
                string = string.replace(/&lt;(\/)*mark&gt;/g, '<$1mark>');

                return string;
            },
            message: function (message, type, header) {
                let html = '';
                if (message !== undefined && type !== undefined) {
                    html += ''
                        + '<div class="message ' + type + '">';
                    if (header) {
                        html += ''
                            + '<div class="header">' + header + '</div>';
                    }
                    html += ' <div class="description">' + message + '</div>';
                    html += '</div>';
                }

                return html;
            },
            category: function (response, settings) {
                let html = '';
                let fields = settings.fields;
                let escape = settings.templates.escape;
                if (response[fields.categoryResults] !== undefined) {
                    // each category
                    $.each(response[fields.categoryResults], function (index, category) {
                        if (category[fields.results] !== undefined && category.results.length > 0) {
                            html += '<div class="category">';

                            if (category[fields.categoryName] !== undefined) {
                                html += '<div class="name">' + escape(category[fields.categoryName], settings) + '</div>';
                            }

                            // each item inside category
                            html += '<div class="results">';
                            $.each(category.results, function (index, result) {
                                html += result[fields.url]
                                    ? '<a class="result" href="' + result[fields.url].replace(/"/g, '') + '">'
                                    : '<a class="result">';
                                if (result[fields.image] !== undefined) {
                                    html += ''
                                        + '<div class="image">'
                                        + ' <img src="' + result[fields.image].replace(/"/g, '') + '"' + (result[fields.alt] ? ' alt="' + result[fields.alt].replace(/"/g, '') + '"' : '') + '>'
                                        + '</div>';
                                }
                                html += '<div class="content">';
                                if (result[fields.price] !== undefined) {
                                    html += '<div class="price">' + escape(result[fields.price], settings) + '</div>';
                                }
                                if (result[fields.title] !== undefined) {
                                    html += '<div class="title">' + escape(result[fields.title], settings) + '</div>';
                                }
                                if (result[fields.description] !== undefined) {
                                    html += '<div class="description">' + escape(result[fields.description], settings) + '</div>';
                                }
                                html += ''
                                    + '</div>';
                                html += '</a>';
                            });
                            html += '</div>';
                            html += ''
                                + '</div>';
                        }
                    });
                    if (response[fields.action]) {
                        html += fields.actionURL === false
                            ? ''
                                + '<div class="action">'
                                + escape(response[fields.action][fields.actionText], settings)
                                + '</div>'
                            : ''
                                + '<a href="' + response[fields.action][fields.actionURL].replace(/"/g, '') + '" class="action">'
                                + escape(response[fields.action][fields.actionText], settings)
                                + '</a>';
                    }

                    return html;
                }

                return false;
            },
            standard: function (response, settings) {
                let html = '';
                let fields = settings.fields;
                let escape = settings.templates.escape;
                if (response[fields.results] !== undefined) {
                    // each result
                    $.each(response[fields.results], function (index, result) {
                        html += result[fields.url]
                            ? '<a class="result" href="' + result[fields.url].replace(/"/g, '') + '">'
                            : '<a class="result">';
                        if (result[fields.image] !== undefined) {
                            html += ''
                                + '<div class="image">'
                                + ' <img src="' + result[fields.image].replace(/"/g, '') + '"' + (result[fields.alt] ? ' alt="' + result[fields.alt].replace(/"/g, '') + '"' : '') + '>'
                                + '</div>';
                        }
                        html += '<div class="content">';
                        if (result[fields.price] !== undefined) {
                            html += '<div class="price">' + escape(result[fields.price], settings) + '</div>';
                        }
                        if (result[fields.title] !== undefined) {
                            html += '<div class="title">' + escape(result[fields.title], settings) + '</div>';
                        }
                        if (result[fields.description] !== undefined) {
                            html += '<div class="description">' + escape(result[fields.description], settings) + '</div>';
                        }
                        html += ''
                            + '</div>';
                        html += '</a>';
                    });
                    if (response[fields.action]) {
                        html += fields.actionURL === false
                            ? ''
                                + '<div class="action">'
                                + escape(response[fields.action][fields.actionText], settings)
                                + '</div>'
                            : ''
                                + '<a href="' + response[fields.action][fields.actionURL].replace(/"/g, '') + '" class="action">'
                                + escape(response[fields.action][fields.actionText], settings)
                                + '</a>';
                    }

                    return html;
                }

                return false;
            },
        },
    };

    $.extend($.easing, {
        easeOutExpo: function (x) {
            return x === 1 ? 1 : 1 - Math.pow(2, -10 * x);
        },
    });
})(jQuery, window, document);
