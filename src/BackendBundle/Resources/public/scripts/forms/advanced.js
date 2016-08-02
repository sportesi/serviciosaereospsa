$(document).ready(function ($) {
    $(".select2").select2({});
    $('.selectpicker').selectpicker({});
    $('.tokenfield').tokenfield({});
    $(".tagsinput").tagsinput();
    $(".multiselect").multiSelect();
    $('.clockpicker').clockpicker({});
    $('.spinner').asSpinner({
        namespace: 'asSpinner',
        skin: 'simple',
        value: 0,
        min: 0,
        max: 10,
        step: 1,
        looping: true
    });

    $(".touchspin").TouchSpin({});
    $('.timepicker').timepicker();
    $('.datepicker').datepicker({});
    $('.input-daterange').datepicker({});
    $(".knob").knob();

    $(".multi-select-methods").multiSelect();

    $("#buttonSelectAll").click(function () {
        $(".multi-select-methods").multiSelect("select_all")
    });

    $("#buttonDeselectAll").click(function () {
        $(".multi-select-methods").multiSelect("deselect_all")
    });
    $("#buttonSelectSome").click(function () {
        $(".multi-select-methods").multiSelect("select", ["Idaho", "Montana", "Arkansas"])
    });
    $("#buttonDeselectSome").click(function () {
        $(".multi-select-methods").multiSelect("select", ["Idaho", "Montana", "Arkansas"])
    });
    $("#buttonRefresh").on("click", function () {
        $(".multi-select-methods").multiSelect("refresh")
    });
    $("#buttonAdd").on("click", function () {
        $(".multi-select-methods").multiSelect("addOption", {
            value: 42,
            text: "test 42",
            index: 0
        });
    });

    var cities = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        prefetch: 'datas/cities.json'
    });
    cities.initialize();

    var elt = $('#inputTagsObject');
    elt.tagsinput({
        itemValue: 'value',
        itemText: 'text',
        allowDuplicates: false,
        typeaheadjs: {
            name: 'cities',
            displayKey: 'text',
            source: cities.ttAdapter()
        }
    });
    elt.tagsinput('add', {"value": 1, "text": "Amsterdam", "continent": "Europe"});
    elt.tagsinput('add', {"value": 4, "text": "Washington", "continent": "America"});
    elt.tagsinput('add', {"value": 7, "text": "Sydney", "continent": "Australia"});
    elt.tagsinput('add', {"value": 10, "text": "Beijing", "continent": "Asia"});
    elt.tagsinput('add', {"value": 13, "text": "Cairo", "continent": "Africa"});

    $("#exampleTimeButton").on("click", function () {
        $("#inputTextCurrent").timepicker("setTime", new Date)
    });

    var engine = new Bloodhound({
        local: [{
                value: "red"
            }, {
                value: "blue"
            }, {
                value: "green"
            }, {
                value: "yellow"
            }, {
                value: "violet"
            }, {
                value: "brown"
            }, {
                value: "purple"
            }, {
                value: "black"
            }, {
                value: "white"
            }],
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace("value"),
        queryTokenizer: Bloodhound.tokenizers.whitespace
    });
    $("#inputTokenfieldTypeahead").tokenfield({
        typeahead: [null, {
                name: "engine",
                displayKey: "value",
                source: engine.ttAdapter()
            }]
    });

    $("#inputTokenfieldEvents").on("tokenfield:createtoken", function (e) {
        var data = e.attrs.value.split("|");
        e.attrs.value = data[1] || data[0],
                e.attrs.label = data[1] ? data[0] + " (" + data[1] + ")" : data[0]
    }).on("tokenfield:createdtoken", function (e) {
        var re = /\S+@\S+\.\S+/
                , valid = re.test(e.attrs.value);
        valid || $(e.relatedTarget).addClass("invalid")
    }).on("tokenfield:edittoken", function (e) {
        if (e.attrs.label !== e.attrs.value) {
            var label = e.attrs.label.split(" (");
            e.attrs.value = label[0] + "|" + e.attrs.value
        }
    }).on("tokenfield:removedtoken", function (e) {
        if (e.attrs.length > 1) {
            var values = $.map(e.attrs, function (attrs) {
                return attrs.value
            });
            alert(e.attrs.length + " tokens removed! Token values were: " + values.join(", "))
        } else
            alert("Token removed! Token value was: " + e.attrs.value)
    }).tokenfield();

    $("#inlineDatepicker").datepicker(),
            $("#inlineDatepicker").on("changeDate", function (event) {
        $("#inputHiddenInline").val($("#inlineDatepicker").datepicker("getFormattedDate"))
    });


    // initialize input widgets first
    $('#datePairExample .time').timepicker({
        'showDuration': true,
        'timeFormat': 'g:ia'
    });

    $('#datePairExample .date').datepicker({
        'format': 'm/d/yyyy',
        'autoclose': true
    });

    // initialize datepair
    $('#datePairExample').datepair();

    $(".asColorpicker").asColorPicker();
});

 