function fnAjaxRequest(url, method, data, options = {}) {
    const defaultOptions = {
        url: url,
        method: method,
        data: data,
        contentType: "application/json",
        success: (resp) => {
            if (resp.callback) {
                executeFn(resp.callback, resp.data, window.CallbackMap);
            }
        },
        error: (err) => {
            console.log(err);
        }
    };

    const ajaxOptions = Object.assign({}, defaultOptions, options);

    $.ajax(ajaxOptions);
}

function fnGet(url, data, options = {}) {
    return fnAjaxRequest(url, 'GET', data, options);
}

function fnPost(url, data, options = {}) {
    return fnAjaxRequest(url, 'POST', data, options);
}

function fnGetFormData(formId = 'command') {
    return {
        getUrl: () => $('#' + formId).attr('action'),
        getData: () => $('#' + formId).serializeObject(),
    }
}

function fnRedirectUrl(url) {
    location.href = url;
}

function fnReloadPage() {
    location.reload(true);
}

function executeFn(callbackStr, data, callbackMap = {}) {
    if (typeof callbackStr !== "string" || callbackStr.trim() === "") return;

    // 1. __DATA__ 치환
    const finalCode = callbackStr.includes("__DATA__")
        ? callbackStr.replace("__DATA__", JSON.stringify(data))
        : callbackStr;

    // 2. 함수명 추출 시 괄호 포함된 경우만 분기
    const isFunctionCall = /\w+\s*\(.*\)/.test(finalCode);
    const fnName = isFunctionCall ? finalCode.split("(")[0].trim() : null;
    const fn = fnName ? callbackMap[fnName] : null;

    try {
        if (typeof fn === "function") {
            // 3. 함수 실행
            const argsString = finalCode.slice(fnName.length);
            const fnWithArgs = new Function("fn", `return fn${argsString}`);
            fnWithArgs(fn);
        } else {
            // 4. 일반 코드 실행 (ex: location.href = '/')
            const runCode = new Function(finalCode);
            runCode();
        }
    } catch (e) {
        console.error("콜백 실행 오류:", e);
    }
}

export {
    fnAjaxRequest,
    fnGet,
    fnPost,
    fnGetFormData,
    fnRedirectUrl,
    fnReloadPage,
    executeFn,
}