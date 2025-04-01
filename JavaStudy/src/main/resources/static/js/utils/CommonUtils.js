function fnAjaxRequest(url, method, data, options = {}) {
    const defaultOptions = {
        url: url,
        method: method,
        data: data,
        contentType: "application/json",
        success: (resp) => {
            if (resp.callback) {
                executeFn(resp.callback, resp.data);
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

function executeFn(callbackStr, data) {
    if (typeof callbackStr !== "string" || callbackStr.trim() === "") return;

    // 1. __DATA__ 치환 (객체 통째로 넘길 수 있게)
    let finalCode = callbackStr.includes("__DATA__")
        ? callbackStr.replace("__DATA__", JSON.stringify(data))
        : callbackStr;

    try {
        // 2. 코드 실행 (함수 호출 or location.href 등 처리 가능)
        const fn = new Function(finalCode);
        fn();
    } catch (e) {
        console.error("콜백 실행 오류:", e);
    }
}