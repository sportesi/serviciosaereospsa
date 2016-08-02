"use strict";
var fullcalendar;

!function ($) {
    $(document).ready(function () {
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        fullcalendar = $('#calendar').fullCalendar({
            header: {
                left: 'title',
                center: '',
                right: 'prev,next today '
            },
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            events: [
                {title: 'All Day Event', start: new Date(y, m, 1)},
                {title: 'Long Event', start: new Date(y, m, d - 5), end: new Date(y, m, d - 2), className: ['b-info']},
                {title: 'Go to the beach', start: new Date(y, m, d - 1), className: ['b-warning']},
                {id: 999, title: 'Repeating Event', start: new Date(y, m, d - 3, 16, 0), allDay: false, className: ['b-danger']},
                {id: 999, title: 'Repeating Event', start: new Date(y, m, d + 4, 16, 0), allDay: false, className: ['b-danger']},
                {title: 'Birthday Party', start: new Date(y, m, d + 1, 19, 0), end: new Date(y, m, d + 1, 22, 30), allDay: false},
                {title: 'Coffee', start: new Date(y, m, d + 2, 9, 0), end: new Date(y, m, d + 2, 12, 0), allDay: false, className: ['b-success']},
                {title: 'Click for Google', start: new Date(y, m, 28), end: new Date(y, m, 29), url: 'http://google.com/'},
                {title: 'Shopping', start: new Date(y, m + 1, 8)},
            ]
        });
    });
}(window.jQuery);

function changeView(param) {
    fullcalendar.fullCalendar('changeView', param);
}


