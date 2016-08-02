function ShowLoader(){
	swal({
		title: 'Cargando', 
		text: 'Aguarde un momento por favor', 
		allowEscapeKey: false, 
		showConfirmButton: false, 
		imageUrl: '/bundles/backend/img/482.gif'
	})
}

function HideAllAlerts(){
	swal.close()
}