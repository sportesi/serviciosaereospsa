$(document).ready(function (){
    $("#chart1").easyPieChart({
        animate: {
            duration: 500,
            enabled: true
        },
        size: 70,barColor: '#73dd4d',lineWidth: 3,scaleColor:false
    });
    $("#chart2").easyPieChart({
        animate: {
            duration: 500,
            enabled: true
        },
        size: 70,barColor: '#65c7f9',lineWidth: 3,scaleColor:false
    });
     $("#chart3").easyPieChart({
        animate: {
            duration: 500,
            enabled: true
        },
        size: 70,barColor: '#fec07e',lineWidth: 3,scaleColor:false
    });
});