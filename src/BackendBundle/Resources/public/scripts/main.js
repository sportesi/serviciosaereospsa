String.prototype.capitalizeFirstLetter = function() {
    return this.charAt(0).toUpperCase() + this.slice(1);
}



/* Calendar logic */

function InitCalendar() {
	$('td.clickable').on('click', function(){
		console.log(this);
	})
}