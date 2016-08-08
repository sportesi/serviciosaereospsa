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
		$(this).toggleClass('bg-success')
		newEvent(data)
	})
}

function newEvent(data) {
	console.log(data)
	$('#newEvent').modal()	
}