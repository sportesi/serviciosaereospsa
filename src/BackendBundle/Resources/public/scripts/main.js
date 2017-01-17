String.prototype.capitalizeFirstLetter = function () {
    return this.charAt(0).toUpperCase() + this.slice(1);
};

/* Calendar logic */

var selectedDates = [];
var selectedDatesDelete = [];
var turnos = null;
var modo = 'crear';
var selected;

function initCalendar() {
    $('td.clickable').on('click', function () {
        var cell = $(this);
        var data = null;
        if (window.event.ctrlKey) {
            if (!cell.data('turno')) {
                cell.toggleClass('bg-primary');
                data = $(this).data();
                selectedDates = _.uniqBy(selectedDates, 'fecha');
                if (cell.hasClass('bg-primary')) {
                    selectedDates.push(data);
                } else {
                    _.remove(selectedDates, data);
                }
            } else {
                cell.toggleClass('bg-danger');
                data = $(this).data();
                selectedDatesDelete = _.uniqBy(selectedDatesDelete, 'turno');
                selectedDatesDelete.push(data);
            }
        } else {
            if (!cell.data('turno')) {
                data = {
                    avion: cell.data('avion'),
                    updatedAt: cell.data('updatedAt'),
                    fecha: cell.data('fecha')
                };
                newEvent(data, this);
            } else {
                data = {
                    avion: cell.data('avion'),
                    fecha: cell.data('fecha'),
                    turno: cell.data('turno')
                };
                editEvent(data);
            }
        }
    });

    showLoading();
    jQuery(document).ready(function ($) {
        setTimeout(function () {
            loadEvents();
        }, 1000);
    });

}

function newEvent(data, cell) {
    $('[name="turno[id]"]').val(0);
    $('[name="turno[avion]"]').val(data.avion);
    $('[name="turno[updatedAt]"]').val(data.updatedAt);
    $('[name="turno[fecha]"]').val(moment(data.fecha, 'DD-MM-YYYY').format("YYYY-MM-DD"));
    $('[name="turno[comentario]"]').val("");
    if (selectedDates.length > 0) {
        $('[name="turno[multiple]"]').val(true);
        $('[name="turno[selected-dates]"]').val(JSON.stringify(selectedDates));
    }
    

    $('#newEvent .modal-title, #newEvent .btn-success, #newEvent .btn-danger').hide();
    $('#newEvent .form-new-title, #newEvent .form-new-btn').show();
    $('.move-turno').hide();

    $('#newEvent').modal('show');
    $('#newEvent').on('hidden.bs.modal', function () {
        $('#newEvent').off('hidden.bs.modal');
        $(cell).removeClass('bg-piloto');
        if ($(cell).text().trim() !== "") {
            $(cell).removeClass('bg-alumno');
            $(cell).addClass('bg-alumno');
        }
    });
}

function editEvent(data) {
    console.log(data);

    $('[name="turno[id]"]').val(data.turno.id);
    $('[name="turno[avion]"]').val(data.avion);
    $('[name="turno[updatedAt]"]').val(data.updatedAt);
    $('[name="turno[fecha]"]').val(moment(data.fecha).format("YYYY-MM-DD"));
    $('[name="turno[comentario]"]').val(data.turno.comentario);
    $('.form-delete-btn').data(data);
    $('#newEvent .modal-title, #newEvent .btn-success').hide();
    $('#newEvent .btn-danger, #newEvent .form-edit-title, #newEvent .form-edit-btn').show();
    $('.move-turno').show();
    $('#newEvent').modal('show');
}

function showLoading() {
    swal({
        imageUrl: '/bundles/backend/img/loader.gif',
        title: 'Cargando',
        text: 'Por favor espere',
        showConfirmButton: false,
        allowEscapeKey: false,
        imageSize: '80x80'
    });
}

function hideLoading() {
    swal.close();
}

function deleteEvent() {
    swal({
        title: 'Atencion!',
        text: 'Estas a punto de eliminar un turno. \nEsta accion no puede deshacerse',
        type: 'warning',
        showCancelButton: true,
        cancelButtonText: 'Cancelar'
    }, function () {
        showLoading();
        $.ajax({
            url: '/backend/turno/delete',
            type: 'DELETE',
            data: { 'ids': getSelected() }
        })
        .done(function() {
            $('#newEvent').modal('hide');
            loadEvents();
        })
        .fail(function() {
            swal('Intente nuevamente', 'Ocurrio un error, pruebe a refrescar la pagina', 'warning');
        });        
    });
}

function switchMode() {
    modo = (modo === 'crear' ? 'mover' : 'crear');
    var btnMover = $('.btn-modo-mover');
    var btnCrear = $('.btn-modo-crear');
    var tdClickable = $('td.clickable');
    switch (modo) {
        case 'crear':
            var data;
            btnMover.hide();
            btnCrear.show();
            tdClickable
                .off('click')
                .on('click', function () {
                    if (!$(this).data('turno')) {
                        data = {
                            dia: $(this).data('dia'),
                            horario: $(this).data('horario'),
                            avion: $(this).data('avion'),
                            updatedAt: $(this).data('updatedAt'),
                            fecha: $(this).data('fecha')
                        };
                        newEvent(data, this);
                    } else {
                        data = {
                            dia: $(this).data('dia'),
                            horario: $(this).data('horario'),
                            avion: $(this).data('avion'),
                            updatedAt: $(this).data('updatedAt'),
                            fecha: $(this).data('fecha'),
                            turno: $(this).data('turno')
                        };
                        editEvent(data);
                    }
                });
            break;
        case 'mover':

            btnCrear.hide();
            btnMover.show();
            tdClickable
                .off('click')
                .on('click', function () {
                    var turno = $(this).data('turno');
                    if (turno) {
                        selected = turno;
                        $('#newEvent').on('hidden.bs.modal', function () {
                            $('#newEvent').off('hidden.bs.modal');
                        });
                    } else {
                        if (selected) {
                            var data = {
                                dia: $(this).data('dia'),
                                horario: $(this).data('horario'),
                                avion: $(this).data('avion'),
                                updatedAt: $(this).data('updatedAt'),
                                fecha: $(this).data('fecha'),
                                turno: selected
                            };
                            editEvent(data);
                            selected = null;
                        }
                    }
                });
            break;
    }

}

function setPopoverOn() {
    $('td.bg-piloto div, td.bg-alumno div')
        .off('mouseover')
        .on('mouseover', function () {
            if ($(this).data('content')) {
                $(this).popover({placement: 'top'});
                $(this).popover('show');
            }
        })
        .off('mouseout')
        .on('mouseout', function () {
            if ($(this).data('content')) {
                $(this).popover('hide');
            }
        });
}

function disableFoxtrotSierra() {
    $('tr[data-fsd]').each(function() {
        var data = $(this).data();
        if (data.fsd) {
            var day = moment(date).startOf('isoweek').day(data.dia);
            var fsd = moment(data.fsd.date);
            var fsh = moment(data.fsh.date);
            var tfs = data.tfs;
            var rfs = data.rfs;
            if (day.isSameOrAfter(fsd, 'day') && day.isSameOrBefore(fsh, 'day')) {
                var tdStart = null ;
                var count = 0;
                $(this).find('td[data-hparsed]').each(function() {
                    var dataTr = $(this).data();
                    var hparsed = parseInt(dataTr.hparsed) / 100;
                    day.hour(hparsed);
                    if (day.isSameOrAfter(fsd) && day.isSameOrBefore(fsh)) {
                        if (!tdStart) {
                            tdStart = $(this);
                        } else {
                            $(this).remove();
                        }
                        count++;
                    }
                });
                if (tdStart) {
                    tdStart.attr('colspan', count);
                    tdStart.text(tfs + ': ' + rfs);
                    tdStart.addClass('bg-warning');
                }
            }
        }
    });
}

function saveEvent() {
    showLoading();
    var url = '/backend/turno/create';
    var parameters = $('.form-new-event').serialize();
    $.post(url, parameters, function(){
        $('#newEvent').modal('hide');
        loadEvents();
    }).fail(function(response){
        swal('Atención', response, 'warning');
    });
}

function loadEvents() {
    $.getJSON('/backend/turno/json', {start: startComplete, end: endComplete}, function (response) {
        cleanGrid();
        turnos = response;
        for (var i = 0; i < response.length; i++) {
            var turno = response[i];

            var cell = $('#'+turno.avion.id+moment.unix(turno.fecha.timestamp).format('DDMMYYYYHHmm'));
            if (turno.user) {
                if (turno.user.roles.indexOf("ROLE_PILOT") > -1) {
                    cell.addClass('bg-piloto');
                } else {
                    cell.addClass('bg-alumno');
                }
                cell.find('div').text(turno.user.userData.lastName.toLowerCase());
            }
            if (turno.comentario) {
                cell.find('div').data('content', turno.comentario);
            }
            cell.data('turno', turno);
        }
        disableFoxtrotSierra();
        setPopoverOn();
        hideLoading();
    }).fail(function () {
        swal('Intente nuevamente', 'Ocurrio un error, pruebe a refrescar la pagina', 'warning');
    });
}

function getSelected(){
    var idArray = [];
    if (selectedDatesDelete.length === 0) {
        idArray.push($('[name="turno[id]"]').val());
    } else {
        idArray = _.map(_.map(selectedDatesDelete, 'turno'), 'id');
    }
    return idArray;
}

function cleanGrid(){
    $('td.clickable.bg-piloto')
        .removeClass('bg-piloto')
        .find('div')
        .text('');
    $('td.clickable.bg-alumno')
        .removeClass('bg-alumno')
        .find('div')
        .text('');
}