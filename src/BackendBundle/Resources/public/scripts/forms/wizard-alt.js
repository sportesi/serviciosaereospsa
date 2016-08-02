var formValidation = function () {

    var self = this;

    this.container = "#form-steps";
    this.actualStep = 1;

    this.init = function () {
        $(function () {
            $('.parsley-form').on('submit', function (e) {
                e.preventDefault();
                var form = $(this);
                if (form.parsley().isValid()) {
                    self.setValidWizard();
                    self.actualStep++;
                    self.setStep();
                }
            });
        });
    };

    this.setStep = function () {
        $("#form-steps .form-step").each(function (i) {
            if (self.actualStep === i + 1) {
                $(this).removeClass("hidden-xs-up");
            } else {
                $(this).addClass("hidden-xs-up");
            }
        });

        $(".wizard li").each(function (i) {
            if (self.actualStep === i + 1) {
                $(this).addClass("active");
            } else {
                $(this).removeClass("active");
            }
        });
    };
    
    this.setValidWizard = function(){
        $(".wizard li").each(function (i) {
            if (self.actualStep === i + 1) {
                $(this).addClass("valid");
            }
        });
    };

    this.formIsValid = function (el) {
        if ($(el).parsley().isValid()) {
            return true;
        }
        return false;
    };

    this.prevStep = function () {
        this.actualStep--;
        this.setStep();
    };

};

var formValidationAlt = new formValidation();
formValidationAlt.init();

