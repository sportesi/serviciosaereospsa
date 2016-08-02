$(function () {
    'use strict';
    var zoom = 11;
    var map = null;

    function getRandomData() {
        var randData = [];
        for (var i = 0; i < 24; i++) {
            randData.push(~~(Math.random() * (6 - 1 + 1)) + 1);
        }
        return randData;
    }

    function getRandomCoord(lat, lng, bool) {
        var latO = 52.3702157;
        var lngO = 4.895167899999933;
        return {"lat": latO + lat, "lng": lngO + lng, icon: bool ? 'http://flat-edge.com/assets/down_pin.png' : 'http://flat-edge.com/assets/up_pin.png'};
    }

    var zoomIn = function zoomIn() {
        zoom += 1;
        map.zoomIn(zoom);
    }

    var zoomOut  = function() {
        zoom -= 1;
        map.zoomOut(zoom);
    }

    $(document).ready(function () {

        $("#zoomInBtn").click(zoomIn);
        $("#zoomOutBtn").click(zoomOut);

        var mapOptions = {
            el: '#google-map',
            center: new google.maps.LatLng(52.3702157, 4.895167899999933),
            zoom: zoom,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: true,
            styles: [{
                    featureType: 'water',
                    elementType: 'all',
                    stylers: [{
                            hue: '#e9ebed'
                        }, {
                            saturation: -78
                        }, {
                            lightness: 67
                        }, {
                            visibility: 'simplified'
                        }]
                }, {
                    featureType: 'landscape',
                    elementType: 'all',
                    stylers: [{
                            hue: '#ffffff'
                        }, {
                            saturation: -100
                        }, {
                            lightness: 100
                        }, {
                            visibility: 'simplified'
                        }]
                }, {
                    featureType: 'road',
                    elementType: 'geometry',
                    stylers: [{
                            hue: '#bbc0c4'
                        }, {
                            saturation: -93
                        }, {
                            lightness: 31
                        }, {
                            visibility: 'simplified'
                        }]
                }, {
                    featureType: 'poi',
                    elementType: 'all',
                    stylers: [{
                            hue: '#ffffff'
                        }, {
                            saturation: -100
                        }, {
                            lightness: 100
                        }, {
                            visibility: 'off'
                        }]
                }, {
                    featureType: 'road.local',
                    elementType: 'geometry',
                    stylers: [{
                            hue: '#e9ebed'
                        }, {
                            saturation: -90
                        }, {
                            lightness: -8
                        }, {
                            visibility: 'simplified'
                        }]
                }, {
                    featureType: 'transit',
                    elementType: 'all',
                    stylers: [{
                            hue: '#e9ebed'
                        }, {
                            saturation: 10
                        }, {
                            lightness: 69
                        }, {
                            visibility: 'on'
                        }]
                }, {
                    featureType: 'administrative.locality',
                    elementType: 'all',
                    stylers: [{
                            hue: '#2c2e33'
                        }, {
                            saturation: 7
                        }, {
                            lightness: 19
                        }, {
                            visibility: 'on'
                        }]
                }, {
                    featureType: 'road',
                    elementType: 'labels',
                    stylers: [{
                            hue: '#bbc0c4'
                        }, {
                            saturation: -93
                        }, {
                            lightness: 31
                        }, {
                            visibility: 'on'
                        }]
                }, {
                    featureType: 'road.arterial',
                    elementType: 'labels',
                    stylers: [{
                            hue: '#bbc0c4'
                        }, {
                            saturation: -93
                        }, {
                            lightness: -2
                        }, {
                            visibility: 'simplified'
                        }]
                }],
            highlighted: {
                icon: 'http://flat-edge.com/assets/down_pin.png'
            },
            unhighlighted: {
                icon: 'http://flat-edge.com/assets/up_pin.png'
            }
        };

        map = new GMaps(mapOptions);

        map.addMarker(getRandomCoord(0.1, -0.02, 0));
        map.addMarker(getRandomCoord(-0.01, 0.05, 1));
        map.addMarker(getRandomCoord(0.02, 0.01, 0));
        map.addMarker(getRandomCoord(0.01, 0.05, 1));
        map.addMarker(getRandomCoord(-0.07, -0.08, 0));
        map.addMarker(getRandomCoord(-0.01, 0.08, 1));
        map.addMarker(getRandomCoord(-0.025, 0.033, 0));
        map.addMarker(getRandomCoord(-0.005, -0.003, 1));
        map.addMarker(getRandomCoord(-0.0999, -0.0099, 0));
        map.addMarker(getRandomCoord(0.03, 0.09, 1));
        map.addMarker(getRandomCoord(0.06, -0.08, 0));
        map.addMarker(getRandomCoord(0.09, 0.02, 1));
        map.addMarker(getRandomCoord(0.03, 0.06, 1));

        var options = {
            type: 'bar',
            barColor: '#eaeaea',
            barWidth: 12,
            barSpacing: 2,
            height: '30px'
        };
        $('.sparkline').each(function () {
            $(this).html(getRandomData().join(','));
        });
        $('.sparkline').sparkline('html', options);
    })
});
