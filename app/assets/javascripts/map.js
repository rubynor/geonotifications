//= require turbolinks

/* Map */
'use strict';

var Map = function () {
    var map,
        mapOptions = {
            center:new google.maps.LatLng(-34.397, 150.644),
            zoom:8,
            mapTypeId:google.maps.MapTypeId.ROADMAP
        };
    var initialize = function () {
        google.maps.event.addDomListener(window, 'load', renderMap);
    };

    var renderMap = function() {
        new google.maps.Map(document.getElementById('map-container'), mapOptions);
    };

    return {
        initialize:initialize
    }
}();

