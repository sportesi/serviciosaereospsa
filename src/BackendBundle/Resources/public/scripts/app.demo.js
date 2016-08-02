$appModule.prototype.toggleSetting = function (el) {
    this.saveSettings();
    var bool = $(el).prop('checked');
    var value = $(el).attr('name');
    this.app.settings[value] = bool;
    this.changeSettings();
};

$appModule.prototype.setCheckBoxes = function () {
    var $root = this;
    $(document).ready(function () {
        $.each($root.app.settings, function (key, value) {
            var el = $("#settings-switcher-demo input:checkbox[name=" + key + "]");
            if (el.length) {
                if (value) {
                    el.prop('checked', true);
                }
                else{
                    el.prop('checked', false);
                }
            }
        });
    });
};

$appModule.prototype.changeTheme = function (el) {
    var el = $(el);
    var theme = el.attr('title');
    this.app.themes.map(function(item){
        if(item!==theme){
            $('body').removeClass(item.theme);
            $("#theme-switcher-demo [title="+item.theme+"]").html("");
        }
    });
    $("#theme-switcher-demo [title="+theme+"]").html('<i class="fa fa-check" style="line-height:30px;"></i>');
    $('body').addClass(theme);
};

$appModule.prototype.setDefaultSettings = function () {
    this.app = this.getDefaultSettings();
    this.saveSettings();
    this.changeSettings();
    this.setCheckBoxes();
    this.changeTheme($("#theme-switcher-demo [title="+this.app.settings.theme+"]"));
};

$app.setCheckBoxes();

