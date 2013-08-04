//= require turbolinks


/* App */
'use strict';
var geo = geo || {};

$(function () {
    geo.App = function () {
        var logged_in = false;
        var initialize = function () {
            if($('body').hasClass('connected')) {
                logged_in = true;
                $(document).trigger('user:loggedin');
            } else {
                logged_in = false;
                $(document).trigger('user:loggedout');
            }
            geo.Map.initialize();
            geo.Area.initialize($('#areas'));

            if(loggedIn()) {
                geo.Area.fetchAreas();
            }

        };

        var loggedIn = function() {
            return logged_in;
        };

        return {
            loggedIn: loggedIn,
            initialize: initialize
        }
    }();

    geo.App.initialize();
})
