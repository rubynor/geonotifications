//= require turbolinks

/* Map */
'use strict';
var geo = geo || {};

$(function () {
    geo.Map = function () {
        var map,
            drawingManager,
            mapOptions = {
                center: new google.maps.LatLng(-34.397, 150.644),
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

        // Init map
        var initialize = function () {
            google.maps.event.addDomListener(window, 'load', renderMap);
        };

        // Render map, and add drawingManager
        var renderMap = function () {
            map = new google.maps.Map(document.getElementById('map-container'), mapOptions);
            drawingManager = new google.maps.drawing.DrawingManager({
                drawingControl: true,
                drawingControlOptions: {
                    position: google.maps.ControlPosition.TOP_CENTER,
                    drawingModes: [
                        google.maps.drawing.OverlayType.POLYGON,
                    ]
                },
                markerOptions: {
                    icon: '' // Add marker image?
                },
                polygonOptions: {
                    fillOpacity: 0.3,
                    strokeWeight: 2,
                    clickable: false,
                    editable: true,
                    zIndex: 1
                }
            });
            drawingManager.setMap(map);
            bindEvents();
        };

        // Map events
        var bindEvents = function () {
            google.maps.event.addListener(drawingManager, 'overlaycomplete', function (event) {

                // Event: Impossible to add multiple events?
                google.maps.event.addListener(event.overlay.getPath(), 'set_at', function() {
                    formatData(event);
                });
                google.maps.event.addListener(event.overlay.getPath(), 'insert_at', function() {
                    formatData(event);
                });
                formatData(event);
            });
        };

        var formatData = function(event) {
            var points = event.overlay.getPath().getArray();
            var area = [];

            $.each(points, function (i, point) {
                area.push({ lat: point.lat(), lng: point.lng() });
            });

            // Add area to right toolbar
            geo.Area.addArea(area, event.overlay.__gm_id);
        };

        var addAreaToMap = function(area) {
            area.setMap(map);
        };

        // Return public methods
        return {
            initialize: initialize,
            addAreaToMap: addAreaToMap
        }
    }();
});

