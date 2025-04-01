function fnAjaxRequest(url, method, data) {
    $.ajax({
        url: url,
        method: method,
        data: data,
        contentType: "application/json",
        success: (resp) => {
            // resp 에 담긴 methodName, params 실행
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
        getUrl: () => $('#' + formId).attr('url'),
        getData: () => $('#' + formId).serializeObject(),
    }
}

function fnRedirectUrl(url) {
    location.href = url;
}

function fnReloadPage() {
    location.reload(true);
}