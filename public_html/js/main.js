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
    setClickEvent();
    showLoading();

    jQuery(document).ready(function ($) {
        setTimeout(function () {
            loadEvents();
        }, 1000);
    });
}

function newEvent(data) {
    $('[name="turno[id]"]').val(0);
    $('[name="turno[avion]"]').val(data.avion);
    $('[name="turno[fecha]"]').val(moment(data.fecha, 'YYYY-MM-DD').format("YYYY-MM-DD"));
    $('[name="turno[comentario]"]').val("");
    $('[name="turno[horario]"]').val(data.horario);
    $('[name="turno[user]"]').val('').trigger('change');
    if (selectedDates.length > 0) {
        $('[name="turno[multiple]"]').val(true);
        $('[name="turno[selected-dates]"]').val(JSON.stringify(selectedDates));
    }

    $('#newEvent .modal-title, #newEvent .btn-success, #newEvent .btn-danger').hide();
    $('#newEvent .form-new-title, #newEvent .form-new-btn').show();
    $('.move-turno').hide();

    $('#newEvent').modal('show');
}

function editEvent(data) {
    console.log(data);
    $('[name="turno[id]"]').val(data.turno.id);
    $('[name="turno[avion]"]').val(data.avion);
    $('[name="turno[fecha]"]').val(moment.unix(data.turno.fecha.timestamp).format("YYYY-MM-DD"));
    $('[name="turno[comentario]"]').val(data.turno.comentario);
    $('[name="turno[user]"]').val(data.turno.user.id).trigger('change');
    $('[name="turno[horario]"]').val(data.horario);

    $('#newEvent .modal-title, #newEvent .btn-success').hide();
    $('#newEvent .btn-danger, #newEvent .form-edit-title, #newEvent .form-edit-btn').show();
    $('.move-turno').show();
    $('#newEvent').modal('show');
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
            data: {'ids': getSelected()}
        })
            .done(function () {
                $('#newEvent').modal('hide');
                selectedDatesDelete = [];
                loadEvents();
            })
            .fail(function () {
                swal('Intente nuevamente', 'Ocurrio un error, pruebe a refrescar la pagina', 'warning');
            });
    });
}

function saveEvent(edit) {
    showLoading();
    var form = $('.form-new-event');
    var parameters = form.serialize();
    var urlCreate = '/backend/turno/create';
    var urlUpdate = '/backend/turno/update/' + form.find('#turno-id').val();

    if (!form.find('#turno-user').val()) {
        swal('', 'Debe seleccionar un usuario', 'error');
        return;
    }

    $.post((edit ? urlUpdate : urlCreate), parameters, function () {
        $('#newEvent').modal('hide');
        selectedDates = [];
        loadEvents();
    }).fail(function (response) {
        swal('Atención', response, 'warning');
    });
}

function showLoading() {
    swal({
        imageUrl: '/img/loader.gif',
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

function switchMode() {
    modo = (modo === 'crear' ? 'mover' : 'crear');
    var btnMover = $('.btn-modo-mover');
    var btnCrear = $('.btn-modo-crear');
    var tdClickable = $('td.clickable');
    switch (modo) {
        case 'crear':
            btnMover.hide();
            btnCrear.show();
            setClickEvent();
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
                            var data = $(this).data();
                            data.turno = selected;
                            data.turno.fecha.timestamp = moment(data.fecha).hour(parseInt(data.horario) / 100).unix();
                            editEvent(data);
                            selected = null;
                        }
                    }
                });
            break;
    }

}

function setPopoverOn() {
    $('td div, td div')
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
    $.getJSON('/backend/avion/disabled', function (planes) {
        for (i = 0; i < planes.length; i++) {
            if (!planes[i].servicio && planes[i].desdeFueraServicio && planes[i].hastaFueraServicio) {
                var lt = planes[i].desdeFueraServicio.timestamp;
                var gt = planes[i].hastaFueraServicio.timestamp;
                var diff = moment.unix(gt).diff(moment.unix(lt), 'hours');
                for (h = 1; h <= diff; h++) {
                    var day = moment.unix(lt).add(h, 'hours');
                    var id = planes[i].id + day.format('YYYYMMDDHH00');
                    var td = $('td#' + id);
                    td.addClass('bg-service');
                    if (td.find('div').text().trim() === "") {
                        if (!td.find('div').length) {
                            td.append('<div></div>');
                        }
                        td.find('div').text('F/S');
                        if (td.find('div').data('content') !== "") {
                            td.find('div').data('content', planes[i].razonFueraServicio);
                        }
                    }
                    setPopoverOn();
                }
            }
        }
    });

}

function loadEvents() {
    $.getJSON('/backend/turno/json', {start: startComplete, end: endComplete}, function (response) {
        cleanGrid();
        turnos = response;
        for (var i = 0; i < response.length; i++) {
            var turno = response[i];

            var cell = $('#' + turno.avion.id + moment.unix(turno.fecha.timestamp).format('YYYYMMDDHHmm'));
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

function getSelected() {
    var idArray = [];
    if (selectedDatesDelete.length === 0) {
        idArray.push($('[name="turno[id]"]').val());
    } else {
        idArray = _.map(_.map(selectedDatesDelete, 'turno'), 'id');
    }
    return idArray;
}

function cleanGrid() {
    $('td.clickable')
        .removeData('turno')
        .removeClass('bg-piloto')
        .removeClass('bg-alumno')
        .removeClass('bg-delete')
        .removeClass('bg-primary')
        .find('div')
        .text('');
}

function setClickEvent() {
    $('td.clickable').off('click').on('click', function () {
        var cell = $(this);
        var data = null;
        if (window.event.ctrlKey) {
            if (!cell.data('turno')) {
                cell.toggleClass('bg-primary');
                data = $(this).data();
                data.id = $(this).attr('id');
                if (cell.hasClass('bg-primary')) {
                    selectedDates.push(data);
                } else {
                    _.remove(selectedDates, data);
                }
                selectedDates = _.uniqBy(selectedDates, 'id');
            } else {
                cell.toggleClass('bg-delete');
                data = $(this).data();
                data.id = $(this).attr('id');
                if (cell.hasClass('bg-delete')) {
                    selectedDatesDelete.push(data);
                } else {
                    _.remove(selectedDatesDelete, data);
                }
                selectedDatesDelete = _.uniqBy(selectedDatesDelete, 'id');
            }
        } else {
            if (!cell.data('turno')) {
                newEvent(cell.data());
            } else {
                editEvent(cell.data());
            }
        }
    });
}