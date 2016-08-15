$(document).ready(function(){

	//Code to center the content div
	$box = $('.content');
	$ht = $box.height()+175;
	$win_ht = $(window).height();

	if ($win_ht>$ht) {
		$box.css({
			'left' : '50%',
			'top' : '50%',
			'margin-left' : -$box.width()/2 + 'px',
			'margin-top' : -$ht/2 + 'px'
		});
	}else{
		$box.css({
			'left' : '50%',
			'margin-left' : -$box.width()/2 + 'px',
			'margin-top' : '60px',
			'margin-bottom' : '60px'
		});
	}





	
	//code for the background slider
	$.backstretch([
      "/bundles/frontend/img/bg_img.jpg",
      "/bundles/frontend/img/bg_img2.jpg",
      "/bundles/frontend/img/bg_img3.jpg"
    ], {
        fade: 750,
        duration: 2500
    });





	
 	//code for the cerlces Countdouwn
	$(".counter").TimeCircles({
	    "direction": "Clockwise",
	    "animation": "Tricks",
	    "bg_width": 0,
	    "fg_width": 0.01,
	    "circle_bg_color": "rgba(255, 255, 255, 0)",
	    "circle_bg_fill_color": "rgba(255, 255, 255, 0.1)",
	    "time": {
	        "Days": {
	            "text": "Days",
	            "color": "#ffffff",
	            "show": true
	        },
	        "Hours": {
	            "text": "Hrs",
	            "color": "#ffffff",
	            "show": true
	        },
	        "Minutes": {
	            "text": "Mins",
	            "color": "#ffffff",
	            "show": true
	        },
	        "Seconds": {
	            "text": "Secs",
	            "color": "#ffffff",
	            "show": true
	        }
	    }
	});





	
	//To show loading icon on form submit
	$('#sub_form').submit(function(){
			submit_icons('icon', 'loading');
	})

	if($('#sub_form').length){
		//Mailchim Subscription form
		$('#sub_form').ajaxChimp({
		    callback: bcFunction
		});
	}
	

	//Mail chimp callback function
	function bcFunction (resp) {
   		if (resp.result === 'success') {
			submit_icons('loading', 'icon');
	        show_tooltip('Thank You For Subscribing To Our Email List');
	        $('#sub_form #mc-email').val('');
	    }else{
			submit_icons('loading', 'icon');
	        show_tooltip('Please Enter a Correct Email');
	    }
	}

	//show and hide loading icon
	function submit_icons(hide, show){
			$('#mc_submit i').removeClass(hide);
			$('#mc_submit i').addClass(show);
	}

	//Show ToolTip
    function show_tooltip(msg){

    	if ($(".tooltip").length){
	    	$(".tooltip").remove(); 
	    }

        $('.subscription_form').append('<span class="tooltip"></span>');
        
        var tooltip = $(".tooltip");
        tooltip.append(msg);
         
        var tipwidth = tooltip.outerWidth();
        var a_width = $('.subscription_form').width();
        var a_hegiht = $('.subscription_form').height() + 10;

        var tipwidth = ( a_width- tipwidth)/2;
        $('.tooltip').css({
            'left' : tipwidth + 'px',
            'bottom' : a_hegiht + 'px'
        }).stop().animate({
            opacity : 1
        }, 300);

        setTimeout(function(){
        	hide_tooltip();
        }, 2000);
       
	}

	//Hide ToolTip
	function hide_tooltip(){

		var tooltip = $(".tooltip"); 
		 tooltip.animate({
            opacity : 0
        }, 300, function(){
        	tooltip.remove();
        });

	}

});


/* Logica del calendario */

String.prototype.capitalizeFirstLetter = function() {
	return this.charAt(0).toUpperCase() + this.slice(1)
}

/* Calendar logic */

function initCalendar() {
	$('td.clickable').on('click', setClickEvent)

	$('.form-group-alumno select').on('change', function() {
		$('.form-group-piloto select').prop('required', $(this).val() === "")
	})
	$('.form-group-piloto select').on('change', function() {
		$('.form-group-alumno select').prop('required', $(this).val() === "")
	})

	ShowLoading()
	jQuery(document).ready(function($) {
		setTimeout(function(){
			$.getJSON('/turno/calendario/get/by/' + $('[name=user]').val(), {start: startComplete, end: endComplete}, function(json, textStatus) {
				for (var i = 0; i < json.length; i++) {
					var turno = json[i]
					var cell = $('td[data-dia='+turno.dia.id+'][data-avion='+turno.avion.id+'][data-horario='+turno.horario.id+']')
					cell.toggleClass('bg-success')
					if (turno.alumno) {
						cell.text(turno.alumno.apellido)
					} else {
						cell.text(turno.piloto.apellido)
					}
					cell.data('turno', turno)
				}
				$.getJSON('/turno/calendario/get/json', {start: startComplete, end: endComplete}, function(response){
					for (var i = 0; i < response.length; i++) {
						var turno = response[i]
						var cell = $('td[data-dia='+turno.dia.id+'][data-avion='+turno.avion.id+'][data-horario='+turno.horario.id+']')
						if (!cell.data('turno')) {
							cell.addClass('bg-disabled')
							cell.removeClass('clickable')
							cell.off('click')
							cell.text('')
							cell.data('turno', turno)
						}
					}
					HideLoading()
				}).fail(function(){
					swal('Intente nuevamente', 'Ocurrio un error, prueba a refrescar la pagina', 'warning')
				})
			}).fail(function(){
				swal('Intente nuevamente', 'Ocurrio un error, prueba a refrescar la pagina', 'warning')
			})
		}, 1000)
	})

}

function newEvent(data, cell) {
	
	$('[name="turno[id]"]').val(0)
	$('[name="turno[dia]"]').val(data.dia)
	$('[name="turno[horario]"]').val(data.horario)
	$('[name="turno[avion]"]').val(data.avion)
	$('[name="turno[updatedAt]"]').val(data.updatedAt)
	$('[name="turno[fecha]"]').val(data.fecha)
	$('[name="turno[comentario]"]').val("")
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

function setClickEvent() {
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
}