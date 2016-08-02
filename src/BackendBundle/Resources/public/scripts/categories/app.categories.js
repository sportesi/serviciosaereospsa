var serializedData = undefined

jQuery(document).ready(function($) {
	InitNestable()

	toastr.options.timeOut = 3000
	toastr.options.closeButton = true
	toastr.options.progressBar = true
    $('[name="category[is_trimmings]"]').bootstrapToggle({
        on: 'Trimmings',
        off: 'Paperplott',
        width: '175px',
        onstyle: 'warning',
        offstyle: 'default',
    });
    $('[name="category[is_trimmings]"]').on('change', function(){
    	window.location.href = '/CentralPaperplott/Category/List/' + ( $(this).prop('checked') ? 'Trimmings' : 'Paperplott' )
    })
})

function UpdateCategories(newCategory) {
	$.ajax({
		url: window.location.pathname,
		type: 'POST',
		data: serializedData,
	})
	.done(function(response) {
		if (newCategory) {
			$('.dd ol:first li:last').attr('data-id', response)
			var parent = $('.dd').parent('.panel-body')
			parent.find('li button').remove()
			var newList = parent.html()
			parent.html(newList)
			InitNestable()
		}
	})
	.fail(function() {
		swal("Ha surgido un error actualizando las categorias")
	})
	
	return true
}

function InitNestable() {
	$('.dd').nestable({maxDepth: 3})
	serializedData = JSON.stringify($('.dd').nestable('serialize'))

	$('.dd').on('change', function(){
		var data = JSON.stringify($(this).nestable('serialize'))
		if (data != serializedData) {
			toastr.info('Categorias actualizadas!')
			serializedData = data
			UpdateCategories()
		}
	})
}

function EditCategory(button) {
	$('.categoryUpdateForm').show()
	$('.categoryForm').hide()
	var jButton = $(button).parents('li').eq(1)
	var isParent = !$(button).parents('li').eq(2).length
	var jParent = $(button).parents('li').eq(2)
	var data = {
		id: jButton.attr('data-id'),
		name: jButton.attr('data-name'),
		father: isParent ? 0 : jParent.attr('data-id'),
	}
	$('.categoryUpdateForm form input').prop('disabled', false)
	$('.categoryUpdateForm form button').prop('disabled', false)
	$('.categoryUpdateForm form input[name="category[father]"]').val(data.father)
	$('.categoryUpdateForm form input[name="category[id]"]').val(data.id)
	$('.categoryUpdateForm form input[name="category[name]"]').val(data.name)
}

function DeleteCategory(deleteUri){
	swal({
		title: "Esta seguro?",
		text: "Esta a punto de eliminar una categoria",
		type: "warning",
		showCancelButton: "true",
		confirmButtonText: "Si, eliminar",
		cancelButtonText: "No",
		closeOnConfirm: false,
		showLoaderOnConfirm: true,
	}, function(){
		window.location.href = deleteUri
	})
}