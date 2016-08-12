String.prototype.capitalizeFirstLetter = function() {
	return this.charAt(0).toUpperCase() + this.slice(1)
}

/* Calendar logic */

function initCalendar() {
	$('td.clickable').on('click', function(){
		if (!$(this).data('turno')) {
			var data = {
				dia: $(this).data('dia'),
				horario: $(this).data('horario'),
				avion: $(this).data('avion'),
				updatedAt: $(this).data('updatedAt'),
				fecha: $(this).data('fecha'),
			}
			$(this).addClass('bg-info')
			newEvent(data, this)
		} else {
			var data = {
				dia: $(this).data('dia'),
				horario: $(this).data('horario'),
				avion: $(this).data('avion'),
				updatedAt: $(this).data('updatedAt'),
				fecha: $(this).data('fecha'),
				turno: $(this).data('turno'),
			}
			editEvent(data)
		}
	})

	$('.form-group-alumno select').on('change', function() {
		$('.form-group-piloto select').prop('required', $(this).val() === "")
	})
	$('.form-group-piloto select').on('change', function() {
		$('.form-group-alumno select').prop('required', $(this).val() === "")
	})

	/*ShowLoading()
	jQuery(document).ready(function($) {
		setTimeout(function(){
			$.getJSON('/backend/turnos/listado/get/json', {start: startComplete, end: endComplete},function(response){
				for (var i = 0; i < response.length; i++) {
					var turno = response[i]
					var cell = $('td[data-dia='+turno.dia.id+'][data-avion='+turno.avion.id+'][data-horario='+turno.horario.id+']')
					cell.toggleClass('bg-success')
					if (turno.alumno) {
						cell.text(turno.alumno.apellido)
					} else {
						cell.text(turno.piloto.apellido)
					}
					cell.data('turno', turno)
				}
				HideLoading()
			}).fail(function(){
				swal('Intente nuevamente', 'Ocurrio un error, prueba a refrescar la pagina', 'warning')
			})
		}, 1000)
	})*/

}

function newEvent(data, cell) {
	
	$('[name="turno[id]"]').val(0)
	$('[name="turno[dia]"]').val(data.dia)
	$('[name="turno[horario]"]').val(data.horario)
	$('[name="turno[avion]"]').val(data.avion)
	$('[name="turno[updatedAt]"]').val(data.updatedAt)
	$('[name="turno[fecha]"]').val(data.fecha)
	$('[name="turno[comentario]"]').val("")
	$('#newEvent .form-group-alumno select, #newEvent .form-group-piloto select').val('').trigger('change')
	$('#newEvent .modal-title, #newEvent .btn-success, #newEvent .btn-danger').hide()
	$('#newEvent .form-new-title, #newEvent .form-new-btn').show()
	$('#newEvent').modal()
	$('#newEvent').on('hidden.bs.modal', function(){
		$('#newEvent').off('hidden.bs.modal')
		$(cell).removeClass('bg-info')
		if ($(cell).text() !== "") {
			$(cell).removeClass('bg-success')
			$(cell).addClass('bg-success')
		}
	})
}

function editEvent(data) {
	
	if (data.turno.alumno) {
		$('#newEvent .form-group-alumno select').val(data.turno.alumno.id).trigger('change')
	}
	if (data.turno.piloto) {
		$('#newEvent .form-group-piloto select').val(data.turno.piloto.id).trigger('change')
	}
	$('[name="turno[id]"]').val(data.turno.id)
	$('[name="turno[dia]"]').val(data.dia)
	$('[name="turno[horario]"]').val(data.horario)
	$('[name="turno[avion]"]').val(data.avion)
	$('[name="turno[updatedAt]"]').val(data.updatedAt)
	$('[name="turno[fecha]"]').val(data.fecha)
	$('[name="turno[comentario]"]').val(data.turno.comentario)
	$('.form-delete-btn').data(data)
	$('#newEvent .modal-title, #newEvent .btn-success').hide()
	$('#newEvent .btn-danger, #newEvent .form-edit-title, #newEvent .form-edit-btn').show()
	$('#newEvent').modal('show')
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
	})
}
function HideLoading() {
	swal.close()
}


function deleteTurno(turno) {
	var data = $(turno).data()
	swal({
		title: 'Atencion!',
		text: 'Estas a punto de eliminar un turno. \nEsta accion no puede deshacerse',
		type: 'warning',
		showCancelButton: true,
		cancelButtonText: 'Cancelar',
		closeOnConfirm: false,   
		showLoaderOnConfirm: true,
	}, function(){
		window.location.href = '/backend/turnos/listado/delete/' + data.turno.id
	})
}

var modo = 'crear'
var selected
function switchMode() {
	modo = (modo === 'crear' ? 'mover' : 'crear')
	switch(modo){
		case 'crear':
			// Habilita clicks para crear o editar turnos
			$('.btn-modo-mover').hide()
			$('.btn-modo-crear').show()
			$('td.clickable').off('click')
			$('td.clickable').on('click', function(){
				if (!$(this).data('turno')) {
					var data = {
						dia: $(this).data('dia'),
						horario: $(this).data('horario'),
						avion: $(this).data('avion'),
						updatedAt: $(this).data('updatedAt'),
						fecha: $(this).data('fecha'),
					}
					$(this).addClass('bg-info')
					newEvent(data, this)
				} else {
					var data = {
						dia: $(this).data('dia'),
						horario: $(this).data('horario'),
						avion: $(this).data('avion'),
						updatedAt: $(this).data('updatedAt'),
						fecha: $(this).data('fecha'),
						turno: $(this).data('turno'),
					}
					editEvent(data)
				}
			})
			break
		case 'mover':
			// Deshabilita creacion y edicion de turnos, para habilitar traslado
			$('.btn-modo-crear').hide()
			$('.btn-modo-mover').show()
			$('td.clickable').off('click')
			$('td.clickable').on('click', function(){
				var turno = $(this).data('turno')
				if (turno) {
					selected = turno
					$(this).addClass('bg-info')
					var cell = this
					$('#newEvent').on('hidden.bs.modal', function(){
						$('#newEvent').off('hidden.bs.modal')
						$(cell).removeClass('bg-info')
						if ($(cell).text() !== "") {
							$(cell).removeClass('bg-success')
							$(cell).addClass('bg-success')
						}
					})
				} else {
					if (selected) {
						var data = {
							dia: $(this).data('dia'),
							horario: $(this).data('horario'),
							avion: $(this).data('avion'),
							updatedAt: $(this).data('updatedAt'),
							fecha: $(this).data('fecha'),
							turno: selected,
						}
						editEvent(data)
						selected = undefined
					}
				}
			})
			break 
	}
	
}