function $appModule() {

    var $root = this;
    this.layoutType = "";
    this.app = {};
    this.oldApp = {settings: {}};
    this.resizeOn = [];
    this.resizeTimeout = null;
    this.appLoaded = false;
    this.breakPoints = [
        {width: 0, name: 'screen-xs'},
        {width: 768, name: 'screen-sm'},
        {width: 992, name: 'screen-md'},
        {width: 1200, name: 'screen-lg'}
    ];

    this.init = function () {
        $(document).ready(function () {
            $root.app = $root.getDefaultSettings();
            $root.appQuickview();
            $root.appSearch();
            $root.appTopDropDown();
            $root.appNavigation();
            $root.setAsideActiveItem();
            $root.setBrowserResize();
            $root.saveSettings();
            $root.setLayoutType();
            if ($("[data-app-layout-application]").length) {
                $("[data-app-layout-application]").addClass('layout-fixed');
                $root.app.settings.layoutApplication = true;
            }
            if ($root.getLayoutType() === 'screen-xs') {
                $root.app.settings.asideFolded = false;
                $root.app.settings.headerFixed = true;
            }
            $root.changeSettings();
            $('[data-ripple]').materialripple();
            $root.appLoaded = true;
            
        });

    };

    this.checkAsideActiveItemParent = function (el) {
        var parent = $(el).parent();
        if (parent.hasClass('main-nav')) {
            parent.parent().addClass('opened');
            this.checkAsideActiveItemParent(parent.parent());
        }
    };

    this.setAsideActiveItem = function () {
        var url = window.location.pathname.split("/");
        var page = url[url.length - 1];
        $('.app-aside .main-nav li a').each(function () {
            var href = $(this).attr('href');
            if (href && href === page) {
                $(this).parent().addClass('active');
                $root.checkAsideActiveItemParent($(this).parent());
                return 1;
            }
        });
    };

    this.helper = function (bool, settingClass, el) {
        if (el === undefined) {
            el = 'body';
        }
        if (bool) {
            $(el).addClass(settingClass);
        } else {
            $(el).removeClass(settingClass);
        }
    };

    this.saveSettings = function () {
        this.oldApp.settings = JSON.parse(JSON.stringify(this.app.settings));
    };

    this.changeSettings = function () {

        if (this.app.settings.layoutApplication) {
            this.app.settings.asideFixed = true;
            this.app.settings.headerFixed = true;
            this.app.settings.layoutApplication = true;
            this.app.settings.footerFixed = false;
        }

        if (this.app.settings.asideHover) {
            this.app.settings.asideFolded = true;
            this.app.settings.asideDocked = false;
            this.app.settings.asideFixed = false;
            this.app.settings.headerFixed = true;
        }

        this.helper(!this.app.settings.asideFolded, 'app-aside-folded');
        this.helper(this.app.settings.asideDocked, 'app-aside-docked');
        this.helper(this.app.settings.asideFixed, 'app-aside-fixed');
        this.helper(this.app.settings.asideHover, 'app-aside-hover');
        this.helper(this.app.settings.headerFixed, 'app-header-fixed');
        this.helper(this.app.settings.footerFixed, 'app-footer-fixed');
        this.helper(this.app.settings.asideFolded, 'app-aside-show');
        this.helper(this.app.settings.layoutApplication, 'app-layout-application');
        this.helper(this.app.settings.layoutBoxed, 'container', '.app-wrapper');

        if (this.appLoaded && this.isMainSettingsChanged()) {
            this.emitResizeEvent();
        }
    };

    this.isMainSettingsChanged = function () {
        if (this.app.settings.layoutBoxed !== this.oldApp.settings.layoutBoxed
                || (this.app.settings.asideFolded !== this.oldApp.settings.asideFolded && this.layoutType !== 'screen-xs')
                || this.app.settings.asideHover !== this.oldApp.settings.asideHover
                || this.app.settings.asideDocked !== this.oldApp.settings.asideDocked) {
            return true;
        }
        return false;
    };

    this.getDefaultSettings = function () {
        return {
            showSettingsBtn: true,
            settings: {
                theme: 'themeDark',
                showApps: false,
                asideFolded: true,
                asideDocked: false,
                asideFixed: false,
                asideHover: false,
                layoutBoxed: false,
                headerFixed: true,
                footerFixed: false,
                layoutApplication: false,
                lang: 'es_ES'
            },
            themes: [
                {
                    name: 'blue theme',
                    theme: 'themeBlue'
                },
                {
                    name: 'grey theme',
                    theme: 'themeGrey'
                },
                {
                    name: 'white theme',
                    theme: 'themeWhite'
                },
                {
                    name: 'dark theme',
                    theme: 'themeDark'
                },
                {
                    name: 'brown theme',
                    theme: 'themeBrown'
                },
                {
                    name: 'pink theme',
                    theme: 'themePink'
                }
            ]
        };
    };

    this.appNavigation = function () {
        var pattern = "[data-app-navigation]";
        var el = $(pattern);
        var body = $("body");
        var mainAside = $("body .app-aside");
        var min = 150;
        var offset = 43;
        var holder;
        var mainElement;
        var originalWidth = 0;

        function hideNav() {
            holder && holder.trigger('mouseleave.nav');
        }

        function slideUp(el, child) {
            $(child).slideUp("fast", function () {
                $(el).removeClass('opened');
            });
        }

        function slideDown(el, child) {
            $(child).slideDown("fast", function () {
                $(el).addClass('opened');
            });
        }

        function clickEvent(self) {
            var element = $(self);
            var liParent = element.parent();
            var ulParent = liParent.parent();

            if (liParent.children('.nav-children').length > 0) {
                var navChildren = liParent.children('.nav-children');
                if (liParent.hasClass('opened')) {
                    liParent.removeClass('opened');
                    //slideUp(liParent,liParent.children('.nav-children'));
                } else {
                    var liParent = $(liParent);
                    ulParent.children('li').each(function (index, child) {
                        var child = $(child);
                        if (child.hasClass('opened') && !child.hasClass('current')) {
                            child.removeClass('opened');
                            //slideUp(child,child.children('.nav-children'));
                        }
                    });
                    //slideDown(liParent,liParent.children('.nav-children'));
                    liParent.addClass('opened');
                }
            }
        }

        el.on('click', 'a', function (e) {
            hideNav();
            clickEvent(this);
        });

        el.on('mouseenter', 'a', function (e) {
            if (body.hasClass('app-aside-folded') && body.hasClass('app-aside-fixed') && !body.hasClass('app-aside-docked')) {
                hideNav();
                var windowHeight = $(window).height();
                mainElement = $(this);
                if (mainElement.next().is('ul')) {
                    holder = mainElement.next();
                    var top = mainElement.parent().position().top;
                    holder.css('top', top);
                    if (top + holder.height() > windowHeight) {
                        holder.css('bottom', 0);
                    }
                    holder.appendTo(mainAside);
                    holder.on('mouseleave.nav', function (e) {
                        holder.appendTo(mainElement.parent());
                        holder.off('mouseleave.nav').attr("style", "");
                        holder.off('click', 'a');
                    });
                    holder.on('click', 'a', function (e) {
                        clickEvent(this);
                    });
                }
            }
        });

        mainAside.on('mouseleave', function (e) {
            hideNav();
        });

        $root.toggleSideBar = function () {
            $root.saveSettings();
            $root.app.settings.asideFolded = !$root.app.settings.asideFolded;
            if($root.app.settings.asideHover){
                $root.app.settings.asideHover = false;
            }
            $root.changeSettings();
            $root.emitResizeEvent();
        };
    };

    this.appQuickview = function () {
        var pattern = "[data-app-quickview]";
        var el = $(pattern);
        var body = $("body");
        function hide() {
            el.removeClass('app-quickview-show').addClass('app-quickview-hide');
            body.removeClass('quickview-modal');
        }

        function show() {
            el.removeClass('app-quickview-hide').addClass('app-quickview-show');
            body.addClass('quickview-modal');
        }

        $root.toggleQuickview = function () {
            if (el.hasClass('show')) {
                hide();
            } else {
                show();
            }
        };

        el.on('click', function (e) {
            var clickedEl = $(e.target);
            if (clickedEl.hasClass('app-quickview')) {
                hide();
            }
        });

        el.on('click', '.quickview-close', function (e) {
            hide();
        });
    };

    this.appSearch = function () {
        var pattern = "[data-app-search]";
        var el = $(pattern);
        var body = $("body");
        function hide() {
            el.removeClass('app-search-show').addClass('app-search-hide');
            body.removeClass('search-modal');
        }

        function show() {
            el.removeClass('app-search-hide').addClass('app-search-show');
            body.addClass('search-modal');
        }

        $root.toggleSearch = function () {
            if (el.hasClass('app-search-show')) {
                hide();
            } else {
                show();
            }
        };

        el.on('click', function (e) {
            var clickedEl = $(e.target);
            if (clickedEl.hasClass('app-search')) {
                hide();
            }
        });

        el.on('click', '.search-close', function (e) {
            hide();
        });
    };

    this.appTopDropDown = function () {
        var pattern = "[data-app-top-drop-down]";
        var el = $(pattern);
        function hide() {
            el.removeClass('app-top-dropdown-show').addClass('app-top-dropdown-hide');
        }

        function show() {
            el.removeClass('app-top-dropdown-hide').addClass('app-top-dropdown-show');
        }

        $root.toggleTopDropDown = function () {
            if (el.hasClass('app-top-dropdown-show')) {
                hide();
            } else {
                show();
            }
        };

        el.on('click', function (e) {
            var clickedEl = $(e.target);
            if (clickedEl.hasClass('app-top-dropdown')) {
                hide();
            }
        });

        el.on('click', 'a', function (e) {
            hide();
        });

    };

    this.resizeAll = function () {
        if (!$root.resizeOn.length) {
            return false;
        }
        $root.resizeOn.map(function (callback) {
            if (callback && typeof (callback) === "function") {
                callback();
            }
        });
    };

    this.emitResizeEvent = function () {
        clearTimeout($root.resizeTimeout);
        $root.resizeTimeout = setTimeout($root.resizeAll, 400);
    };

    this.setBrowserResize = function () {
        $(window).resize(function () {
            console.log('resizeEvent');
            $root.emitResizeEvent();
            $root.setLayoutType();
        });
    };

    this.addbrowserResize = function (callback) {
        this.resizeOn.push(callback);
    };

    this.setLayoutType = function () {
        var windowWidth = $(window).width();
        var layouType = "";
        $('body').removeClass(this.layoutType);
        this.breakPoints.map(function (obj) {
            if (obj.width < windowWidth) {
                layouType = obj.name;
            }
        });
        $('body').addClass(layouType);
        this.layoutType = layouType;
        this.breakPointChange();
    };


    this.breakPointChange = function () {

    };

    this.getLayoutType = function () {
        return this.layoutType;
    };
}

$app = new $appModule();
$app.init();