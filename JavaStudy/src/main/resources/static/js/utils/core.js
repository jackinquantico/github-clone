import * as CommonUtils from './CommonUtils.js';
import * as GitGraphBuilder from './GitGraphBuilder.js';

(() => {
    window.CommonUtils = (function () {
        return Object.assign({}, CommonUtils);
    })();
    window.GitGraphBuilder = (function () {
        return Object.assign({}, GitGraphBuilder);
    })();
})();