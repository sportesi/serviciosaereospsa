$(document).ready(function () {

    var commitsOptions = {
        type: 'bar',
        barColor: '#BBDEFB',
        lineWidth: 1,
        'barWidth': 8,
        'barSpacing': 4,
        height: '35px',
        width: '100%'
    };

    var activityOptions = {
        type: 'bar',
        barColor: '#BBDEFB',
        lineWidth: 1,
        'barWidth': 8,
        'barSpacing': 4,
        height: '35px',
        width: '100%'
    };

    $('.sparkline-commit').sparkline('html', commitsOptions);
    $('.sparkline-activity').sparkline('html', activityOptions);

});