$(function () {
    new GMaps({
        div: '#map1',
        lat: -12.043333,
        lng: -77.028333
    });
    var map2 = new GMaps({
        div: '#map2',
        lat: -12.043333,
        lng: -77.028333
    });
    map2.addMarker({
        lat: -12.043333,
        lng: -77.028333,
        title: 'Lima',
        click: function (e) {
            alert('You clicked in this marker');
        }
    });

    var map3 = new GMaps({
        div: '#map3',
        lat: -12.043333,
        lng: -77.028333
    });

    path = [[-12.044012922866312, -77.02470665341184], [-12.05449279282314, -77.03024273281858], [-12.055122327623378, -77.03039293652341], [-12.075917129727586, -77.02764635449216], [-12.07635776902266, -77.02792530422971], [-12.076819390363665, -77.02893381481931], [-12.088527520066453, -77.0241058385925], [-12.090814532191756, -77.02271108990476]];

    map3.drawPolyline({
        path: path,
        strokeColor: '#131540',
        strokeOpacity: 0.6,
        strokeWeight: 6
    });

    panorama = GMaps.createPanorama({
        el: '#map4',
        lat: 42.3455,
        lng: -71.0983
    });

    var map5 = new GMaps({
        div: '#map5',
        lat: -12.043333,
        lng: -77.028333
    });

    var path = [[-12.040397656836609, -77.03373871559225], [-12.040248585302038, -77.03993927003302], [-12.050047116528843, -77.02448169303511], [-12.044804866577001, -77.02154422636042]];

    polygon = map5.drawPolygon({
        paths: path, // pre-defined polygon shape
        strokeColor: '#BBD8E9',
        strokeOpacity: 1,
        strokeWeight: 3,
        fillColor: '#BBD8E9',
        fillOpacity: 0.6
    });


    var map5 = new GMaps({
        div: '#map6',
        lat: -12.043333,
        lng: -77.028333,
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
            }]
    });
});