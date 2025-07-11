/*!
 * # Fomantic-UI - API
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

    $.fn.api = function (parameters) {
        // use window context if none specified
        let $allModules = isFunction(this)
            ? $(window)
            : $(this);
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
                ? $.extend(true, {}, $.fn.api.settings, parameters)
                : $.extend({}, $.fn.api.settings);

            // internal aliases
            let regExp = settings.regExp;
            let namespace = settings.namespace;
            let metadata = settings.metadata;
            let selector = settings.selector;
            let error = settings.error;
            let className = settings.className;

            // define namespaces for modules
            let eventNamespace = '.' + namespace;
            let moduleNamespace = 'module-' + namespace;

            // element that creates request
            let $module = $(this);
            let $form = $module.closest(selector.form);

            // context used for state
            let $context = settings.stateContext ? contextCheck(settings.stateContext, window) : $module;

            // request details
            let ajaxSettings;
            let requestSettings;
            let url;
            let data;
            let requestStartTime;
            let originalData;

            // standard module
            let element = this;
            let context = $context[0];
            let instance = $module.data(moduleNamespace);
            let module;

            module = {

                initialize: function () {
                    if (!methodInvoked) {
                        originalData = settings.data;
                        module.bind.events();
                    }
                    module.instantiate();
                },

                instantiate: function () {
                    module.verbose('Storing instance of module', module);
                    instance = module;
                    $module
                        .data(moduleNamespace, instance);
                },

                destroy: function () {
                    module.verbose('Destroying previous module for', element);
                    $module
                        .removeData(moduleNamespace)
                        .off(eventNamespace);
                },

                bind: {
                    events: function () {
                        let triggerEvent = module.get.event();
                        if (triggerEvent) {
                            module.verbose('Attaching API events to element', triggerEvent);
                            $module
                                .on(triggerEvent + eventNamespace, module.event.trigger);
                        } else if (settings.on === 'now') {
                            module.debug('Querying API endpoint immediately');
                            module.query();
                        }
                    },
                },

                decode: {
                    json: function (response) {
                        if (response !== undefined && typeof response === 'string') {
                            try {
                                response = JSON.parse(response);
                            } catch (e) {
                                // isn't json string
                            }
                        }

                        return response;
                    },
                },

                read: {
                    cachedResponse: function (url) {
                        let response;
                        if (window.Storage === undefined) {
                            module.error(error.noStorage);

                            return;
                        }
                        response = sessionStorage.getItem(url + module.get.normalizedData());
                        module.debug('Using cached response', url, settings.data, response);
                        response = module.decode.json(response);

                        return response;
                    },
                },
                write: {
                    cachedResponse: function (url, response) {
                        if (window.Storage === undefined) {
                            module.error(error.noStorage);

                            return;
                        }
                        if ($.isPlainObject(response)) {
                            response = JSON.stringify(response);
                        }
                        sessionStorage.setItem(url + module.get.normalizedData(), response);
                        module.verbose('Storing cached response for url', url, settings.data, response);
                    },
                },

                query: function () {
                    if (module.is.disabled()) {
                        module.debug('Element is disabled API request aborted');

                        return;
                    }

                    if (module.is.loading()) {
                        if (settings.interruptRequests) {
                            module.debug('Interrupting previous request');
                            module.abort();
                        } else {
                            module.debug('Cancelling request, previous request is still pending');

                            return;
                        }
                    }

                    // pass element metadata to url (value, text)
                    if (settings.defaultData) {
                        $.extend(true, settings.urlData, module.get.defaultData());
                    }

                    // Add form content
                    if (settings.serializeForm) {
                        settings.data = module.add.formData(originalData || settings.data);
                    }

                    // call beforesend and get any settings changes
                    requestSettings = module.get.settings();

                    // check if before send canceled request
                    if (requestSettings === false) {
                        module.cancelled = true;
                        module.error(error.beforeSend);

                        return;
                    }

                    module.cancelled = false;

                    // get url
                    url = module.get.templatedURL();

                    if (!url && !module.is.mocked()) {
                        module.error(error.missingURL);

                        return;
                    }

                    // replace variables
                    url = module.add.urlData(url);
                    // missing url parameters
                    if (!url && !module.is.mocked()) {
                        return;
                    }

                    requestSettings.url = settings.base + url;

                    // look for jQuery ajax parameters in settings
                    ajaxSettings = $.extend(true, {}, settings, {
                        type: settings.method || settings.type,
                        data: data,
                        url: settings.base + url,
                        beforeSend: settings.beforeXHR,
                        success: function () {},
                        failure: function () {},
                        complete: function () {},
                    });

                    module.debug('Querying URL', ajaxSettings.url);
                    module.verbose('Using AJAX settings', ajaxSettings);
                    if (settings.cache === 'local' && module.read.cachedResponse(url)) {
                        module.debug('Response returned from local cache');
                        module.request = module.create.request();
                        module.request.resolveWith(context, [module.read.cachedResponse(url)]);

                        return;
                    }

                    if (!settings.throttle) {
                        module.debug('Sending request', data, ajaxSettings.method);
                        module.send.request();
                    } else {
                        if (!settings.throttleFirstRequest && !module.timer) {
                            module.debug('Sending request', data, ajaxSettings.method);
                            module.send.request();
                            module.timer = setTimeout(function () {}, settings.throttle);
                        } else {
                            module.debug('Throttling request', settings.throttle);
                            clearTimeout(module.timer);
                            module.timer = setTimeout(function () {
                                if (module.timer) {
                                    delete module.timer;
                                }
                                module.debug('Sending throttled request', data, ajaxSettings.method);
                                module.send.request();
                            }, settings.throttle);
                        }
                    }
                },

                should: {
                    removeError: function () {
                        return settings.hideError === true || (settings.hideError === 'auto' && !module.is.form());
                    },
                },

                is: {
                    disabled: function () {
                        return $module.filter(selector.disabled).length > 0;
                    },
                    expectingJSON: function () {
                        return settings.dataType === 'json' || settings.dataType === 'jsonp';
                    },
                    form: function () {
                        return $module.is('form') || $context.is('form');
                    },
                    mocked: function () {
                        return settings.mockResponse || settings.mockResponseAsync || settings.response || settings.responseAsync;
                    },
                    input: function () {
                        return $module.is('input');
                    },
                    loading: function () {
                        return module.request
                            ? module.request.state() === 'pending'
                            : false;
                    },
                    abortedRequest: function (xhr) {
                        if (xhr && xhr.readyState !== undefined && xhr.readyState === 0) {
                            module.verbose('XHR request determined to be aborted');

                            return true;
                        }

                        module.verbose('XHR request was not aborted');

                        return false;
                    },
                    validResponse: function (response) {
                        if (!module.is.expectingJSON() || !isFunction(settings.successTest)) {
                            module.verbose('Response is not JSON, skipping validation', settings.successTest, response);

                            return true;
                        }
                        module.debug('Checking JSON returned success', settings.successTest, response);
                        if (settings.successTest(response)) {
                            module.debug('Response passed success test', response);

                            return true;
                        }

                        module.debug('Response failed success test', response);

                        return false;
                    },
                },

                was: {
                    cancelled: function () {
                        return module.cancelled || false;
                    },
                    successful: function () {
                        return module.request && module.request.state() === 'resolved';
                    },
                    failure: function () {
                        return module.request && module.request.state() === 'rejected';
                    },
                    complete: function () {
                        return module.request && (module.request.state() === 'resolved' || module.request.state() === 'rejected');
                    },
                },

                add: {
                    urlData: function (url, urlData) {
                        let requiredVariables;
                        let optionalVariables;
                        if (url) {
                            requiredVariables = url.match(regExp.required);
                            optionalVariables = url.match(regExp.optional);
                            urlData = urlData || settings.urlData;
                            if (requiredVariables) {
                                module.debug('Looking for required URL variables', requiredVariables);
                                $.each(requiredVariables, function (index, templatedString) {
                                    // allow legacy {$var} style
                                    let variable = templatedString.indexOf('$') !== -1
                                        ? templatedString.slice(2, -1)
                                        : templatedString.slice(1, -1);
                                    let value = $.isPlainObject(urlData) && urlData[variable] !== undefined
                                        ? urlData[variable]
                                        : ($module.data(variable) !== undefined
                                            ? $module.data(variable)
                                            : ($context.data(variable) !== undefined // eslint-disable-line unicorn/no-nested-ternary
                                                ? $context.data(variable)
                                                : urlData[variable]));
                                    // remove value
                                    if (value === undefined) {
                                        module.error(error.requiredParameter, variable, url);
                                        url = false;

                                        return false;
                                    }

                                    module.verbose('Found required variable', variable, value);
                                    value = settings.encodeParameters
                                        ? module.get.urlEncodedValue(value)
                                        : value;
                                    url = url.replace(templatedString, value);
                                });
                            }
                            if (optionalVariables) {
                                module.debug('Looking for optional URL variables', requiredVariables);
                                $.each(optionalVariables, function (index, templatedString) {
                                    // allow legacy {/$var} style
                                    let variable = templatedString.indexOf('$') !== -1
                                        ? templatedString.slice(3, -1)
                                        : templatedString.slice(2, -1);
                                    let value = $.isPlainObject(urlData) && urlData[variable] !== undefined
                                        ? urlData[variable]
                                        : ($module.data(variable) !== undefined
                                            ? $module.data(variable)
                                            : ($context.data(variable) !== undefined // eslint-disable-line unicorn/no-nested-ternary
                                                ? $context.data(variable)
                                                : urlData[variable]));
                                    // optional replacement
                                    if (value !== undefined) {
                                        module.verbose('Optional variable Found', variable, value);
                                        url = url.replace(templatedString, value);
                                    } else {
                                        module.verbose('Optional variable not found', variable);
                                        // remove preceding slash if set
                                        url = url.indexOf('/' + templatedString) !== -1
                                            ? url.replace('/' + templatedString, '')
                                            : url.replace(templatedString, '');
                                    }
                                });
                            }
                        }

                        return url;
                    },
                    formData: function (data) {
                        let formData = {};
                        let hasOtherData;
                        let useFormDataApi = settings.serializeForm === 'formdata';
                        data = data || originalData || settings.data;
                        hasOtherData = $.isPlainObject(data);

                        if (useFormDataApi) {
                            formData = new FormData($form[0]);
                            settings.processData = settings.processData !== undefined ? settings.processData : false;
                            settings.contentType = settings.contentType !== undefined ? settings.contentType : false;
                        } else {
                            let formArray = $form.serializeArray();
                            let pushes = {};
                            let pushValues = {};
                            let build = function (base, key, value) {
                                base[key] = value;

                                return base;
                            };
                            // add files
                            $.each($('input[type="file"]', $form), function (i, tag) {
                                $.each($(tag)[0].files, function (j, file) {
                                    formArray.push({ name: tag.name, value: file });
                                });
                            });
                            $.each(formArray, function (i, el) {
                                if (!regExp.validate.test(el.name)) {
                                    return;
                                }
                                let isCheckbox = $('[name="' + CSS.escape(el.name) + '"]', $form).attr('type') === 'checkbox';
                                let floatValue = parseFloat(el.value);
                                let value = (isCheckbox && el.value === 'on')
                                        || el.value === 'true'
                                        || (String(floatValue) === el.value
                                            ? floatValue
                                            : (el.value === 'false' ? false : el.value));
                                let nameKeys = el.name.match(regExp.key) || [];
                                let pushKey = el.name.replace(/\[]$/, '');
                                if (!(pushKey in pushes)) {
                                    pushes[pushKey] = 0;
                                    pushValues[pushKey] = value;
                                } else if (Array.isArray(pushValues[pushKey])) {
                                    pushValues[pushKey].push(value);
                                } else {
                                    pushValues[pushKey] = [pushValues[pushKey], value];
                                }
                                if (pushKey.indexOf('[]') === -1) {
                                    value = pushValues[pushKey];
                                }

                                while (nameKeys.length > 0) {
                                    let k = nameKeys.pop();

                                    if (k === '' && !Array.isArray(value)) { // foo[]
                                        value = build([], pushes[pushKey]++, value);
                                    } else if (regExp.fixed.test(k)) { // foo[n]
                                        value = build([], k, value);
                                    } else if (regExp.named.test(k)) { // foo; foo[bar]
                                        value = build({}, k, value);
                                    }
                                }
                                formData = $.extend(true, formData, value);
                            });
                        }

                        if (hasOtherData) {
                            module.debug('Extending existing data with form data', data, formData);
                            if (useFormDataApi) {
                                $.each(Object.keys(data), function (i, el) {
                                    formData.append(el, data[el]);
                                });
                                data = formData;
                            } else {
                                data = $.extend(true, {}, data, formData);
                            }
                        } else {
                            module.debug('Adding form data', formData);
                            data = formData;
                        }

                        return data;
                    },
                },

                send: {
                    request: function () {
                        module.set.loading();
                        module.request = module.create.request();
                        if (module.is.mocked()) {
                            module.mockedXHR = module.create.mockedXHR();
                        } else {
                            module.xhr = module.create.xhr();
                        }
                        settings.onRequest.call(context, module.request, module.xhr);
                    },
                },

                event: {
                    trigger: function (event) {
                        module.query();
                        if (event.type === 'submit' || event.type === 'click') {
                            event.preventDefault();
                        }
                    },
                    xhr: {
                        always: function () {
                            // nothing special
                        },
                        done: function (response, textStatus, xhr) {
                            let context = this;
                            let elapsedTime = Date.now() - requestStartTime;
                            let timeLeft = settings.loadingDuration - elapsedTime;
                            let translatedResponse = isFunction(settings.onResponse)
                                ? (module.is.expectingJSON() && !settings.rawResponse
                                    ? settings.onResponse.call(context, $.extend(true, {}, response))
                                    : settings.onResponse.call(context, response))
                                : false;
                            timeLeft = timeLeft > 0
                                ? timeLeft
                                : 0;
                            if (translatedResponse) {
                                module.debug('Modified API response in onResponse callback', settings.onResponse, translatedResponse, response);
                                response = translatedResponse;
                            }
                            if (timeLeft > 0) {
                                module.debug('Response completed early delaying state change by', timeLeft);
                            }
                            setTimeout(function () {
                                if (module.is.validResponse(response)) {
                                    module.request.resolveWith(context, [response, xhr]);
                                } else {
                                    module.request.rejectWith(context, [xhr, 'invalid']);
                                }
                            }, timeLeft);
                        },
                        fail: function (xhr, status, httpMessage) {
                            let context = this;
                            let elapsedTime = Date.now() - requestStartTime;
                            let timeLeft = settings.loadingDuration - elapsedTime;
                            timeLeft = timeLeft > 0
                                ? timeLeft
                                : 0;
                            if (timeLeft > 0) {
                                module.debug('Response completed early delaying state change by', timeLeft);
                            }
                            setTimeout(function () {
                                if (module.is.abortedRequest(xhr)) {
                                    module.request.rejectWith(context, [xhr, 'aborted', httpMessage]);
                                } else {
                                    module.request.rejectWith(context, [xhr, 'error', status, httpMessage]);
                                }
                            }, timeLeft);
                        },
                    },
                    request: {
                        done: function (response, xhr) {
                            module.debug('Successful API Response', response);
                            if (settings.cache === 'local' && url) {
                                module.write.cachedResponse(url, response);
                                module.debug('Saving server response locally', module.cache);
                            }
                            settings.onSuccess.call(context, response, $module, xhr);
                        },
                        complete: function (firstParameter, secondParameter) {
                            let xhr;
                            let response;
                            // have to guess callback parameters based on request success
                            if (module.was.successful()) {
                                response = firstParameter;
                                xhr = secondParameter;
                            } else {
                                xhr = firstParameter;
                                response = module.get.responseFromXHR(xhr);
                            }
                            module.remove.loading();
                            settings.onComplete.call(context, response, $module, xhr);
                        },
                        fail: function (xhr, status, httpMessage) {
                            // pull response from xhr if available
                            let response = module.get.responseFromXHR(xhr);
                            let errorMessage = module.get.errorFromRequest(response, status, httpMessage);
                            if (status === 'aborted') {
                                module.debug('XHR Aborted (Most likely caused by page navigation or CORS Policy)', status, httpMessage);
                                settings.onAbort.call(context, status, $module, xhr);

                                return true;
                            }
                            if (status === 'invalid') {
                                module.debug('JSON did not pass success test. A server-side error has most likely occurred', response);
                            } else if (status === 'error') {
                                if (xhr !== undefined) {
                                    module.debug('XHR produced a server error', status, httpMessage);
                                    // make sure we have an error to display to console
                                    if ((xhr.status < 200 || xhr.status >= 300) && httpMessage !== undefined && httpMessage !== '') {
                                        module.error(error.statusMessage + httpMessage, ajaxSettings.url);
                                    }
                                    settings.onError.call(context, errorMessage, $module, xhr);
                                }
                            }

                            if (settings.errorDuration && status !== 'aborted') {
                                module.debug('Adding error state');
                                module.set.error();
                                if (module.should.removeError()) {
                                    setTimeout(function () {
                                        module.remove.error();
                                    }, settings.errorDuration);
                                }
                            }
                            module.debug('API Request failed', errorMessage, xhr);
                            settings.onFailure.call(context, response, $module, xhr);
                        },
                    },
                },

                create: {

                    request: function () {
                        // api request promise
                        return $.Deferred()
                            .always(module.event.request.complete)
                            .done(module.event.request.done)
                            .fail(module.event.request.fail);
                    },

                    mockedXHR: function () {
                        // xhr does not simulate these properties of xhr but must return them
                        let textStatus = false;
                        let status = false;
                        let httpMessage = false;
                        let responder = settings.mockResponse || settings.response;
                        let asyncResponder = settings.mockResponseAsync || settings.responseAsync;
                        let asyncCallback;
                        let response;
                        let mockedXHR;

                        mockedXHR = $.Deferred()
                            .always(module.event.xhr.complete)
                            .done(module.event.xhr.done)
                            .fail(module.event.xhr.fail);

                        if (responder) {
                            if (isFunction(responder)) {
                                module.debug('Using specified synchronous callback', responder);
                                response = responder.call(context, requestSettings);
                            } else {
                                module.debug('Using settings specified response', responder);
                                response = responder;
                            }
                            // simulating response
                            mockedXHR.resolveWith(context, [response, textStatus, { responseText: response }]);
                        } else if (isFunction(asyncResponder)) {
                            asyncCallback = function (response) {
                                module.debug('Async callback returned response', response);

                                if (response) {
                                    mockedXHR.resolveWith(context, [response, textStatus, { responseText: response }]);
                                } else {
                                    mockedXHR.rejectWith(context, [{ responseText: response }, status, httpMessage]);
                                }
                            };
                            module.debug('Using specified async response callback', asyncResponder);
                            asyncResponder.call(context, requestSettings, asyncCallback);
                        }

                        return mockedXHR;
                    },

                    xhr: function () {
                        let xhr;
                        // ajax request promise
                        xhr = $.ajax(ajaxSettings)
                            .always(module.event.xhr.always)
                            .done(module.event.xhr.done)
                            .fail(module.event.xhr.fail);
                        module.verbose('Created server request', xhr, ajaxSettings);

                        return xhr;
                    },
                },

                set: {
                    error: function () {
                        module.verbose('Adding error state to element', $context);
                        $context.addClass(className.error);
                    },
                    loading: function () {
                        module.verbose('Adding loading state to element', $context);
                        $context.addClass(className.loading);
                        requestStartTime = Date.now();
                    },
                },

                remove: {
                    error: function () {
                        module.verbose('Removing error state from element', $context);
                        $context.removeClass(className.error);
                    },
                    loading: function () {
                        module.verbose('Removing loading state from element', $context);
                        $context.removeClass(className.loading);
                    },
                },

                get: {
                    normalizedData: function () {
                        return typeof settings.data === 'string' ? settings.data : JSON.stringify(settings.data, Object.keys(settings.data).sort());
                    },
                    responseFromXHR: function (xhr) {
                        return $.isPlainObject(xhr)
                            ? (module.is.expectingJSON()
                                ? module.decode.json(xhr.responseText)
                                : xhr.responseText)
                            : false;
                    },
                    errorFromRequest: function (response, status, httpMessage) {
                        return $.isPlainObject(response) && response.error !== undefined
                            ? response.error // use JSON error message
                            : (settings.error[status] !== undefined // use the server error message
                                ? settings.error[status]
                                : httpMessage);
                    },
                    request: function () {
                        return module.request || false;
                    },
                    xhr: function () {
                        return module.xhr || false;
                    },
                    settings: function () {
                        let runSettings;
                        runSettings = settings.beforeSend.call($module, settings);
                        if (runSettings) {
                            if (runSettings.success !== undefined) {
                                module.debug('Legacy success callback detected', runSettings);
                                module.error(error.legacyParameters, runSettings.success);
                                runSettings.onSuccess = runSettings.success;
                            }
                            if (runSettings.failure !== undefined) {
                                module.debug('Legacy failure callback detected', runSettings);
                                module.error(error.legacyParameters, runSettings.failure);
                                runSettings.onFailure = runSettings.failure;
                            }
                            if (runSettings.complete !== undefined) {
                                module.debug('Legacy complete callback detected', runSettings);
                                module.error(error.legacyParameters, runSettings.complete);
                                runSettings.onComplete = runSettings.complete;
                            }
                        }
                        if (runSettings === undefined) {
                            module.error(error.noReturnedValue);
                        }
                        if (runSettings === false) {
                            return runSettings;
                        }

                        return runSettings !== undefined
                            ? $.extend(true, {}, runSettings)
                            : $.extend(true, {}, settings);
                    },
                    urlEncodedValue: function (value) {
                        let decodedValue = window.decodeURIComponent(value);
                        let encodedValue = window.encodeURIComponent(value);
                        let alreadyEncoded = decodedValue !== value;
                        if (alreadyEncoded) {
                            module.debug('URL value is already encoded, avoiding double encoding', value);

                            return value;
                        }
                        module.verbose('Encoding value using encodeURIComponent', value, encodedValue);

                        return encodedValue;
                    },
                    defaultData: function () {
                        let data = {};
                        if (!isWindow(element)) {
                            if (module.is.input()) {
                                data.value = $module.val();
                            } else if (!module.is.form()) {
                                data.text = $module.text();
                            }
                        }

                        return data;
                    },
                    event: function () {
                        if (isWindow(element) || settings.on === 'now') {
                            module.debug('API called without element, no events attached');

                            return false;
                        }
                        if (settings.on === 'auto') {
                            if ($module.is('input')) {
                                return element.oninput !== undefined
                                    ? 'input'
                                    : (element.onpropertychange !== undefined
                                        ? 'propertychange'
                                        : 'keyup');
                            }
                            if ($module.is('form')) {
                                return 'submit';
                            }

                            return 'click';
                        }

                        return settings.on;
                    },
                    templatedURL: function (action) {
                        action = action || settings.action || $module.data(metadata.action) || false;
                        url = settings.url || $module.data(metadata.url) || false;
                        if (url) {
                            module.debug('Using specified url', url);

                            return url;
                        }
                        if (action) {
                            module.debug('Looking up url for action', action, settings.api);
                            if (settings.api[action] === undefined && !module.is.mocked()) {
                                module.error(error.missingAction, settings.action, settings.api);

                                return;
                            }
                            url = settings.api[action];
                        } else if (module.is.form()) {
                            url = $module.attr('action') || $context.attr('action') || false;
                            module.debug('No url or action specified, defaulting to form action', url);
                        }

                        return url;
                    },
                },

                abort: function () {
                    let xhr = module.get.xhr();
                    if (xhr && xhr.state() !== 'resolved') {
                        module.debug('Cancelling API request');
                        xhr.abort();
                    }
                },

                // reset state
                reset: function () {
                    module.remove.error();
                    module.remove.loading();
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
                                // 'Element'        : element,
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
    $.api = $.fn.api;

    $.api.settings = {

        name: 'API',
        namespace: 'api',

        debug: false,
        verbose: false,
        performance: true,

        // object containing all templates endpoints
        api: {},

        // whether to cache responses
        cache: true,

        // whether new requests should abort previous requests
        interruptRequests: true,

        // event binding
        on: 'auto',

        // context for applying state classes
        stateContext: false,

        // duration for loading state
        loadingDuration: 0,

        // whether to hide errors after a period of time
        hideError: 'auto',

        // duration for error state
        errorDuration: 2000,

        // whether parameters should be encoded with encodeURIComponent
        encodeParameters: true,

        // API action to use
        action: false,

        // templated URL to use
        url: false,

        // base URL to apply to all endpoints
        base: '',

        // data that will
        urlData: {},

        // whether to add default data to url data
        defaultData: true,

        // whether to serialize the closest form
        // use true to convert complex named keys like a[b][1][c][] into a nested object
        // use 'formdata' for formdata web api
        serializeForm: false,

        // how long to wait before request should occur
        throttle: 0,

        // whether to throttle first request or only repeated
        throttleFirstRequest: true,

        // standard ajax settings
        method: 'get',
        data: {},
        dataType: 'json',

        // mock response
        mockResponse: false,
        mockResponseAsync: false,

        // aliases for mock
        response: false,
        responseAsync: false,

        // whether onResponse should work with response value without force converting into an object
        rawResponse: true,

        // callbacks before request
        beforeSend: function (settings) {
            return settings;
        },
        beforeXHR: function (xhr) {},
        onRequest: function (promise, xhr) {},

        // after request
        onResponse: false, // function(response) { },

        // response was successful if JSON passed validation
        onSuccess: function (response, $module) {},

        // request finished without aborting
        onComplete: function (response, $module) {},

        // failed JSON success test
        onFailure: function (response, $module) {},

        // server error
        onError: function (errorMessage, $module) {},

        // request aborted
        onAbort: function (errorMessage, $module) {},

        successTest: false,

        // errors
        error: {
            beforeSend: 'The before send function has aborted the request',
            error: 'There was an error with your request',
            exitConditions: 'API Request Aborted. Exit conditions met',
            JSONParse: 'JSON could not be parsed during error handling',
            legacyParameters: 'You are using legacy API success callback names',
            method: 'The method you called is not defined',
            missingAction: 'API action used but no url was defined',
            missingURL: 'No URL specified for api event',
            noReturnedValue: 'The beforeSend callback must return a settings object, beforeSend ignored.',
            noStorage: 'Caching responses locally requires session storage',
            parseError: 'There was an error parsing your request',
            requiredParameter: 'Missing a required URL parameter: ',
            statusMessage: 'Server gave an error: ',
            timeout: 'Your request timed out',
        },

        regExp: {
            required: /{\$*[\da-z]+}/gi,
            optional: /{\/\$*[\da-z]+}/gi,
            validate: /^[_a-z][\w-]*(?:\[[\w-]*])*$/i,
            key: /[\w-]+|(?=\[])/gi,
            push: /^$/,
            fixed: /^\d+$/,
            named: /^[\w-]+$/i,
        },

        className: {
            loading: 'loading',
            error: 'error',
        },

        selector: {
            disabled: '.disabled',
            form: 'form',
        },

        metadata: {
            action: 'action',
            url: 'url',
        },
    };
})(jQuery, window, document);
