String.prototype.capitalizeFirstLetter = function () {
    return this.charAt(0).toUpperCase() + this.slice(1);
};

/* Calendar logic */

var selectedDates = [];

function initCalendar() {
    $('td.clickable').on('click', function () {
        var cell = $(this);
        if (window.event.ctrlKey) {
            if (!cell.data('turno')) {
                cell.toggleClass('bg-primary');
                var data = $(this).data();
                _.pullAllBy(selectedDates, data, _.isEqual);
                selectedDates.push(data);
            }
        } else {
            if (!cell.data('turno')) {
                var data = {
                    dia: cell.data('dia'),
                    horario: cell.data('horario'),
                    avion: cell.data('avion'),
                    updatedAt: cell.data('updatedAt'),
                    fecha: cell.data('fecha')
                };
                cell.addClass('bg-info');
                newEvent(data, this);
            } else {
                var data = {
                    dia: cell.data('dia'),
                    horario: cell.data('horario'),
                    avion: cell.data('avion'),
                    updatedAt: cell.data('updatedAt'),
                    fecha: cell.data('fecha'),
                    turno: cell.data('turno')
                };
                editEvent(data);
            }
        }
    });

    $('.form-group-alumno select').on('change', function () {
        $('.form-group-piloto select').prop('required', $(this).val() === "");
    });
    $('.form-group-piloto select').on('change', function () {
        $('.form-group-alumno select').prop('required', $(this).val() === "");
    });

    ShowLoading();
    jQuery(document).ready(function ($) {
        setTimeout(function () {
            $.getJSON('/backend/turnos/listado/get/json', {start: startComplete, end: endComplete}, function (response) {
                for (var i = 0; i < response.length; i++) {
                    var turno = response[i];
                    var cell = $('td[data-dia=' + turno.dia.id + '][data-avion=' + turno.avion.id + '][data-horario=' + turno.horario.id + ']');
                    if (turno.alumno) {
                        cell.removeClass('bg-success');
                        cell.addClass('bg-success');
                        cell.find('div').text(turno.alumno.apellido);
                    } else {
                        cell.removeClass('bg-info');
                        cell.addClass('bg-info');
                        cell.find('div').text(turno.piloto.apellido);
                    }
                    if (turno.comentario) {
                        cell.find('div').data('content', turno.comentario);
                    }
                    cell.data('turno', turno);
                }
                DisableFoxtrotSierra();
                setPopoverOn();
                HideLoading();
            }).fail(function () {
                swal('Intente nuevamente', 'Ocurrio un error, pruebe a refrescar la pagina', 'warning');
            });
        }, 1000);
    });

}

function newEvent(data, cell) {
    console.log(data);
    $('[name="turno[id]"]').val(0);
    $('[name="turno[dia]"]').val(data.dia);
    $('[name="turno[horario]"]').val(data.horario);
    $('[name="turno[avion]"]').val(data.avion);
    $('[name="turno[updatedAt]"]').val(data.updatedAt);
    $('[name="turno[fecha]"]').val(data.fecha);
    $('[name="turno[comentario]"]').val("");
    if (selectedDates.length > 0) {
        $('[name="turno[multiple]"]').val(true);
        $('[name="turno[selected-dates]"]').val(JSON.stringify(selectedDates));
    }
    
    $('#newEvent .form-group-alumno select, #newEvent .form-group-piloto select').val('').trigger('change');
    $('#newEvent .modal-title, #newEvent .btn-success, #newEvent .btn-danger').hide();
    $('#newEvent .form-new-title, #newEvent .form-new-btn').show();
    $('#newEvent').modal();
    $('#newEvent').on('hidden.bs.modal', function () {
        $('#newEvent').off('hidden.bs.modal');
        $(cell).removeClass('bg-info');
        if ($(cell).text().trim() !== "") {
            $(cell).removeClass('bg-success');
            $(cell).addClass('bg-success');
        }
    });
}

function editEvent(data) {
    $('#newEvent .form-group-alumno select, #newEvent .form-group-piloto select').val('').trigger('change');
    if (data.turno.alumno) {
        $('#newEvent .form-group-alumno select').val(data.turno.alumno.id).trigger('change');
    }
    if (data.turno.piloto) {
        $('#newEvent .form-group-piloto select').val(data.turno.piloto.id).trigger('change');
    }
    $('[name="turno[id]"]').val(data.turno.id);
    $('[name="turno[dia]"]').val(data.dia);
    $('[name="turno[horario]"]').val(data.horario);
    $('[name="turno[avion]"]').val(data.avion);
    $('[name="turno[updatedAt]"]').val(data.updatedAt);
    $('[name="turno[fecha]"]').val(data.fecha);
    $('[name="turno[comentario]"]').val(data.turno.comentario);
    $('.form-delete-btn').data(data);
    $('#newEvent .modal-title, #newEvent .btn-success').hide();
    $('#newEvent .btn-danger, #newEvent .form-edit-title, #newEvent .form-edit-btn').show();
    $('#newEvent').modal('show');
}


/**
 * Prototipo de loader para reemplazar el existente
 * Se cierra con swal.close()
 */
function ShowLoading() {
    swal({
        imageUrl: '/bundles/backend/img/loader.gif',
        title: 'Cargando',
        text: 'Por favor espere',
        showConfirmButton: false,
        allowEscapeKey: false,
        imageSize: '80x80'
    });
}
function HideLoading() {
    swal.close();
}


function deleteTurno(turno) {
    var data = $(turno).data();
    swal({
        title: 'Atencion!',
        text: 'Estas a punto de eliminar un turno. \nEsta accion no puede deshacerse',
        type: 'warning',
        showCancelButton: true,
        cancelButtonText: 'Cancelar',
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function () {
        window.location.href = '/backend/turnos/listado/delete/' + data.turno.id;
    });
}

var modo = 'crear';
var selected;
function switchMode() {
    modo = (modo === 'crear' ? 'mover' : 'crear');
    switch (modo) {
        case 'crear':
            // Habilita clicks para crear o editar turnos
            $('.btn-modo-mover').hide();
            $('.btn-modo-crear').show();
            $('td.clickable').off('click');
            $('td.clickable').on('click', function () {
                if (!$(this).data('turno')) {
                    var data = {
                        dia: $(this).data('dia'),
                        horario: $(this).data('horario'),
                        avion: $(this).data('avion'),
                        updatedAt: $(this).data('updatedAt'),
                        fecha: $(this).data('fecha')
                    };
                    $(this).addClass('bg-info');
                    newEvent(data, this);
                } else {
                    var data = {
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
            break
        case 'mover':
            // Deshabilita creacion y edicion de turnos, para habilitar traslado
            $('.btn-modo-crear').hide();
            $('.btn-modo-mover').show();
            $('td.clickable').off('click');
            $('td.clickable').on('click', function () {
                var turno = $(this).data('turno');
                if (turno) {
                    selected = turno;
                    $(this).addClass('bg-info');
                    var cell = this;
                    $('#newEvent').on('hidden.bs.modal', function () {
                        $('#newEvent').off('hidden.bs.modal');
                        $(cell).removeClass('bg-info');
                        if ($(cell).text() !== "") {
                            $(cell).removeClass('bg-success');
                            $(cell).addClass('bg-success');
                        }
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
            break
    }

}

function setPopoverOn() {
    $('td.bg-info div, td.bg-success div').off('mouseover');
    $('td.bg-info div, td.bg-success div').on('mouseover', function () {
        var div = $(this);
        if (div.data('content')) {
            div.popover({placement: 'top'});
            div.popover('show');
        }
    });
    $('td.bg-info div, td.bg-success div').off('mouseout');
    $('td.bg-info div, td.bg-success div').on('mouseout', function () {
        var div = $(this);
        if (div.data('content')) {
            div.popover('hide');
        }
    });
}

function DisableFoxtrotSierra() {
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