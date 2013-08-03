//= require turbolinks


/* App */
'use strict';
var geo = geo || {};

$(function () {
    geo.App = function () {
        var initialize = function () {
            geo.Map.initialize();
            geo.Area.initialize($('#areas'));
        };

        return {
            initialize: initialize
        }
    }();

    geo.App.initialize();
})
