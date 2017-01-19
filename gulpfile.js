/**
 * Created by sebastian on 19/01/17.
 */

var gulp = require('gulp');
var concat = require('gulp-concat');
var cleanCss = require('gulp-clean-css');
var uglify = require('gulp-uglify');

gulp.task('default', ['compile-css', 'compile-js']);

var cssFiles = [
    'node_modules/bootstrap/dist/css/bootstrap.css',
    'node_modules/bootstrap-sweetalert/dist/sweetalert.css',
    'node_modules/select2/dist/css/select2.css',
    'node_modules/admin-lte/dist/css/AdminLTE.css',
    'node_modules/admin-lte/dist/css/skins/skin-blue.css',
    'assets/backend/css/styles.css'
];

gulp.task('compile-css', function () {
    return gulp.src(cssFiles)
        .pipe(concat('app.css'))
        .pipe(cleanCss())
        .pipe(gulp.dest('public_html/css/'));
});

var jsFiles = [
    'node_modules/jquery/dist/jquery.js',
    'node_modules/bootstrap/dist/js/bootstrap.js',
    'node_modules/bootstrap-sweetalert/dist/sweetalert.js',
    'node_modules/moment/min/moment-with-locales.js',
    'node_modules/select2/dist/js/select2.full.js',
    'node_modules/select2/dist/js/i18n/es.js',
    'node_modules/lodash/lodash.js',
    'node_modules/admin-lte/dist/js/app.js',
    'assets/backend/scripts/main.js'
];

gulp.task('compile-js', function () {
    return gulp.src(jsFiles)
        .pipe(concat('app.js'))
        .pipe(uglify())
        .pipe(gulp.dest('public_html/js/'));
});