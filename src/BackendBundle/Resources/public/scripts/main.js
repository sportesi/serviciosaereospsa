String.prototype.capitalizeFirstLetter = function() {
	return this.charAt(0).toUpperCase() + this.slice(1)
}

/* Calendar logic */

function initCalendar() {
	$('td.clickable').on('click', function(){
		console.log(this)
		var data = {
			dia: $(this).data('dia'),
			horario: $(this).data('horario'),
			avion: $(this).data('avion'),
		}
		$(this).addClass('bg-info')
		newEvent(data, this)
	})
}

function newEvent(data, cell) {
	console.log(data)
	$('[name="turno[dia]"]').val(data.dia)
	$('[name="turno[horario]"]').val(data.horario)
	$('[name="turno[avion]"]').val(data.avion)
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