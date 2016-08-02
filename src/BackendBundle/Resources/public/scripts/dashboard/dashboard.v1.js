$(function () {
    'use strict';
    var init = function () {
        $(document).ready(function () {
            function getRandomdata() {
                var randomData = [[], []];
                var random = new Rickshaw.Fixtures.RandomData(30);
                for (var i = 0; i < 30; i++) {
                    random.addData(randomData);
                }
                return randomData;
            }

            var randomData = getRandomdata();

            var flot = {
                options: {
                    grid: {
                        borderColor: '#eee',
                        borderWidth: 1,
                        color: '#ccc'
                    },
                    series: {
                        lines: {
                            show: false,
                            color: 'grey'
                        },
                        splines: {
                            show: true,
                            tension: 0.3,
                            lineWidth: 0.9,
                            fill: .3
                        }
                    }
                },
                data: [{
                        color: "#fd8aac",
                        data: [[1, 2], [2, 5], [3, 10], [4, 13], [5, 8], [6, 26], [7, 30], [8, 12], [9, 10], [10, 15], [11, 10], [12, 20], [13, 10], [14, 40], [15, 10], [16, 15], [17, 10], [18, 2]]
                    },
                    {
                        color: "#3395ff",
                        data: [[1, 1], [2, 2], [3, 5], [4, 7], [5, 4], [6, 13], [7, 15], [8, 6], [9, 5], [10, 7], [11, 5], [12, 10], [13, 5], [14, 20], [15, 5], [16, 7], [17, 5], [18, 1]]
                    }]
            };
            $("#chart8").html("");
            var serverData = {
                element: document.querySelector("#chart8"),
                renderer: 'bar', height: 150,
                series: [{
                        data: randomData[0],
                        color: "#fec07e",
                        name: "Max treshold"
                    }, {
                        data: randomData[1],
                        color: "#fed9b1",
                        name: "Min treshold"
                    }],
                hover: {
                    formatter: function (series, x, y) {
                        var date = '<span class="date">' + new Date(x * 100000).toUTCString() + '</span>';
                        var swatch = '<span class="detail_swatch" style="background-color: ' + series.color + '"></span>';
                        var content = swatch + series.name + ": " + parseInt(y) + '<br>' + date;
                        return content;
                    }
                }

            };

            var otherData = {
                options: {
                    grid: {
                        borderColor: '#eee',
                        borderWidth: 1,
                        color: '#ccc'
                    },
                    series: {
                        lines: {
                            show: true,
                            color: 'grey'
                        }
                    },
                    legend: {
                        show: false
                    },
                    yaxis: {
                        //show: false
                    },
                    xaxis: {
                        //show: false
                    }
                },
                data: [{
                        shadowSize: 0,
                        color: "#b6f0ea",
                        data: [[1, 5], [2, 20], [3, 30], [4, 23], [5, 18], [6, 6], [7, 0], [8, 10], [9, 10], [10, 15], [11, 10], [12, 20], [13, 10], [14, 40], [15, 10], [16, 15], [17, 10], [18, 2]]
                    },
                    {
                        shadowSize: 0,
                        color: "#e2f2fd",
                        data: [[1, 1], [2, 2], [3, 5], [4, 7], [5, 4], [6, 13], [7, 15], [8, 6], [9, 5], [10, 7], [11, 5], [12, 10], [13, 5], [14, 20], [15, 5], [16, 7], [17, 5], [18, 1]]
                    }]
            };

            $.plot($("#chart7"), flot.data, flot.options);
            $.plot($("#chart9"), otherData.data, otherData.options);

            var rickshaw = new Rickshaw.Graph(serverData);
            rickshaw.render();

            var hoverDetail = new Rickshaw.Graph.HoverDetail({
                graph: rickshaw,
                formatter: serverData.hover.formatter
            });

            $("#chart1").easyPieChart({
                animate: {
                    duration: 500,
                    enabled: true
                },
                size: 140, barColor: '#73dd4d', lineWidth: 3, scaleColor: '#ccc'
            });

            $("#chart2").easyPieChart({
                animate: {
                    duration: 500,
                    enabled: true
                },
                size: 140, barColor: '#fec07e', lineWidth: 3, scaleColor: '#ccc'
            });

            $("#chart3").easyPieChart({
                animate: {
                    duration: 500,
                    enabled: true
                },
                size: 140, barColor: '#fc5888', lineWidth: 3, scaleColor: '#ccc'
            });

            $("#chart4").sparkline([3, 4, 5, 6, 4, 3, 6, 7, 3, 2, 7, 8, 3, 2], {
                type: 'bar',
                barColor: '#3395ff',
                barWidth: 8,
                barSpacing: 15,
                height: '90px'
            });

            $("#chart5").sparkline([4, 2, 3, 4, 4, 2, 3, 4, 3, 5, 3, 2, 1, 4, 6, 7, 8, 5, 6, 7], {
                type: 'line',
                width: '100%',
                height: '100px',
                lineColor: '#65c7f9',
                lineWidth: 2,
                fillColor: false,
                highlightSpotColor: '#000',
                spotColor: false,
                minSpotColor: false,
                maxSpotColor: false,
                spotRadius: 0
            });

            $("#chart6").sparkline([4, 6, 7, 4, 7, 3, 6, 2, 4, 4, 6, 2, 10, 6, 7, 4, 6, 7, 4, 7, 3, 6, 8, 3, 4, 6, 2, 10, 6, 7, 1, 2, 4, 8], {
                lineColor: false,
                fillColor: '#95e578',
                height: '100px',
                width: '100%',
                spotColor: false,
                minSpotColor: false,
                maxSpotColor: false,
                spotRadius: 0
            });

        });
    };
    $app.addbrowserResize(init);
    init();
});