jQuery(document).ready(function($) {
    $('[name="product[is_trimmings]"]').bootstrapToggle({
        on: 'Trimmings',
        off: 'Paperplott',
        width: '175px',
        onstyle: 'warning',
        offstyle: 'default',
    });
    $('[name="product[is_trimmings]"]').on('change', function(){
        var id = window.location.pathname.split('/')
        id = id[id.length - 1]
        window.location.href = '/CentralPaperplott/Products/'+ ( $(this).prop('checked') ? 'Trimmings' : 'Paperplott' )+'/Edit/' + id
    });
    btnDeleteDescEvent()
    $('#').on('click', function(){
        swal({
            title: "Esta seguro?",
            text: "Esta a punto de eliminar este producto.",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Si",
            cancelButtonText: "Cancelar",
            closeOnConfirm: false,
            showLoaderOnConfirm: true
        },
        function (){
            window.location.href = $('#deleteProductBtn').attr('href')
        });
        return false
    })
});


function DeleteImage(deleteUri){
    swal({
        title: "Esta seguro?",
        text: "Esta a punto de eliminar esta imagen.",
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Si",
        cancelButtonText: "Cancelar",
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    },
    function (){
        $.ajax({
            url: deleteUri,
            type: 'DELETE'
        })
        .done(function(response) {
            swal({
                title: "Eliminada!",
                text: "La imagen ha sido eliminada con exito.",
                type: "success",
            }, function(){
                window.location.reload();
            });
        })
        .fail(function() {
            swal("Ha surgido un error","Reintente nuevamente, si el error persiste contacte al administrador","error");
            console.error("error");
        });
    });
}

function PrimaryImage(primaryUri) {
    ShowLoader();
    $.ajax({
        url: primaryUri,
        type: 'PUT'
    })
    .done(function(response) {
        swal(
        {
            title: "Listo!",
            text: "La imagen ha sido seleccionada como \"principal\"",
            type: "success",
        }, function(){
            window.location.reload();
        });
    })
    .fail(function() {
        swal("Ha surgido un error","Reintente nuevamente, si el error persiste contacte al administrador","error");
        console.error("error");
    });
}

function addRowInfo(table) {
    var table = $('#' + table)
    var index = table.find('input').length / 2
    var inputDesc = table.find('tbody').data('prototypeDesc').replace(/__name__/g, index)
    var inputVal = table.find('tbody').data('prototypeVal').replace(/__name__/g, index)
    var btnDeleteDesc = "<button type=\"button\" class=\"btn btn-md btn-danger btnDeleteDesc\"> <i class=\"fa fa-trash\"></i> </button>"
    table.find('tbody').append('<tr>')
    table.find('tbody tr:last').append('<td>')
    table.find('tbody tr:last td:last').append(inputDesc)
    table.find('tbody tr:last').append('<td>')
    table.find('tbody tr:last td:last').append(inputVal)
    table.find('tbody tr:last').append('<td>')
    table.find('tbody tr:last td:last').append(btnDeleteDesc)
    btnDeleteDescEvent()
}

function btnDeleteDescEvent() {
    $('.btnDeleteDesc').off('click')
    $('.btnDeleteDesc').on('click', function(){
        $(this).parents('tr:first').remove()
    })
}