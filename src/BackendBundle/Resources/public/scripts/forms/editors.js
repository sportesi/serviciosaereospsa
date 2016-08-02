$(document).ready(function () {
    $('#summernote').summernote({airMode: false});
    $('#summernote2').summernote({airMode: true});
    $('#summernote3').summernote({height: 150,
        toolbar: [
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']]
        ]});
});