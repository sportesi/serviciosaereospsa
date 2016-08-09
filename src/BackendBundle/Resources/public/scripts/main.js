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
			var data = $(this).data('turno')
			editEvent(data)
		}
	})

	$('.form-group-alumno select').on('change', function() {
		$('.form-group-piloto select').prop('required', $(this).val() === "")
	})
	$('.form-group-piloto select').on('change', function() {
		$('.form-group-alumno select').prop('required', $(this).val() === "")
	})

	ShowLoading()
	$.getJSON('/backend/turnos/listado/get/json', function(response){
		console.log(response)
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

}

function newEvent(data, cell) {
	console.log(data)
	$('[name="turno[dia]"]').val(data.dia)
	$('[name="turno[horario]"]').val(data.horario)
	$('[name="turno[avion]"]').val(data.avion)
	$('[name="turno[updatedAt]"]').val(data.updatedAt)
	$('[name="turno[fecha]"]').val(data.fecha)
	$('#newEvent').modal()
	$('#newEvent').on('hidden.bs.modal', function(){
		$('#newEvent').off('hidden.bs.modal')
		$(cell).removeClass('bg-info')
		if ($(cell).text() !== "") {
			$(cell).removeClass('bg-success')
			$(cell).addClass('bg-success')
		}
		$('.form-group-alumno select').val('').trigger('change')
		$('.form-group-piloto select').val('').trigger('change')
	})
}

function editEvent(data) {
	if (data.alumno) {
		$('.form-group-alumno select').val(data.alumno.id).trigger('change')
	}
	if (data.piloto) {
		$('.form-group-piloto select').val(data.piloto.id).trigger('change')
	}
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
		imageSize: '220x20' 
	})
}
function HideLoading() {
	swal.close()
}