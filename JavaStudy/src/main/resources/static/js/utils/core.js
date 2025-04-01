import * as CommonUtils from './CommonUtils.js';
import * as GitGraphBuilder from './GitGraphBuilder.js';

(() => {
    window.CommonUtils = (function () {
        return Object.assign({}, CommonUtils);
    })();
    window.GitGraphBuilder = (function () {
        return Object.assign({}, GitGraphBuilder);
    })();

    // CallbackMap 에 함수만 필터링하여 등록
    window.CallbackMap = {};
    Object.entries(CommonUtils).forEach(([key, value]) => {
        if (typeof value === 'function') {
            window.CallbackMap[key] = value;
        }
    });
})();