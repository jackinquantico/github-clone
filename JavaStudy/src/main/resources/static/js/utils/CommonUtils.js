function fnAjaxRequest(url, method, data) {
    $.ajax({
        url: url,
        method: method,
        data: data,
        contentType: "application/json",
        success: (resp) => {
            if (resp.callback) {
                executeFn(resp.callback);
            }
        },
        error: (err) => {
            console.log(err);
        }
    })
}

function fnGet(url, data) {
    fnAjaxRequest(url, 'GET', data);
}

function fnPost(url, data) {
    fnAjaxRequest(url, 'POST', data);
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

const ALLOWED_CALLBACKS = {
    fnRedirectUrl: fnRedirectUrl,
    fnReloadPage: fnReloadPage,
};

function executeFn(callbackStr) {
    const match = callbackStr.match(/^([a-zA-Z_$][\w$]*)\((.*)\);?$/);

    if (!match) {
        alert("올바르지 않은 콜백 형식입니다.");
        return;
    }

    const fnName = match[1];
    const rawArgs = match[2];

    if (!(fnName in ALLOWED_CALLBACKS)) {
        alert(`허용되지 않은 콜백 함수: ${fnName}`);
        return;
    }

    try {
        // 문자열 파라미터가 있어도 JSON처럼 파싱되게 처리
        const args = rawArgs.trim()
            ? Function(`"use strict"; return [${rawArgs}]`)()  // safer eval 대체
            : [];

        const fn = ALLOWED_CALLBACKS[fnName];

        if (typeof fn === "function") {
            fn(...args);
        } else {
            alert(`"${fnName}"은 유효한 함수가 아닙니다.`);
        }
    } catch (e) {
        alert(`콜백 실행 오류: ${e.message}`);
    }
}