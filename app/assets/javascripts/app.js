//= require turbolinks

/* App */
'use strict';
var App = function () {
    var initialize = function () {
        Map.initialize();
    };

    return {
        initialize:initialize
    }
}();

App.initialize();
