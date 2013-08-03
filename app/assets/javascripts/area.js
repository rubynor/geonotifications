//= require turbolinks

/* App */
'use strict';
var geo = geo || {};
$(function () {
    geo.Area = function () {
        var container,
            // Todo: refactor/clean up/move template from this file!.
            inputTemplateString = '<p class="area"><input type="text" name="area[title]" placeholder="Area title" />' +
                                  '<% _.each(area, function(area, pi) { %>' +
                                  '<p><input type="hidden" name="area[locations][]" value="<%= [area.lat, area.lng] %>"/></p>' +
                                  '<% }); %>';


        var initialize = function (c) {
            container = c;
            bindEvents();

        };

        var bindEvents = function() {
            $(document).on('area:added', function(ev) {
                $('#save-areas').fadeIn();
            });
        };

        var addArea = function (area) {
            var i = container.find('.area').length;
            var t = _.template(inputTemplateString, { i:i, area:area });
            container.append(t);
            $(document).trigger('area:added');
        };

        var removeArea = function (area) {

        };

        return {
            initialize: initialize,
            addArea: addArea,
            removeArea: removeArea
        }
    }();
});
