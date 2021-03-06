/**
 * Created by sebastian on 19/01/17.
 */

var gulp = require('gulp');
var concat = require('gulp-concat');
var cleanCss = require('gulp-clean-css');
var uglify = require('gulp-uglify');
var sourceMaps = require('gulp-sourcemaps');

gulp.task('default', ['compile-css', 'compile-js']);

var cssFiles = [
    'node_modules/bootstrap/dist/css/bootstrap.css',
    'node_modules/bootstrap-sweetalert/dist/sweetalert.css',
    'node_modules/select2/dist/css/select2.css',
    'node_modules/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css',
    'node_modules/admin-lte/dist/css/AdminLTE.css',
    'node_modules/admin-lte/dist/css/skins/skin-blue.css',
    'assets/backend/css/*.css'
];

gulp.task('compile-css', function () {
    return gulp.src(cssFiles)
        .pipe(cleanCss())
        .pipe(concat('app.min.css'))
        .pipe(gulp.dest('public_html/css/'));
});

var jsFiles = [
    'node_modules/jquery/dist/jquery.min.js',
    'node_modules/bootstrap/dist/js/bootstrap.min.js',
    'node_modules/bootstrap-sweetalert/dist/sweetalert.min.js',
    'node_modules/admin-lte/dist/js/app.min.js'
];

gulp.task('compile-js', function () {
    return gulp.src(jsFiles)
        .pipe(sourceMaps.init())
        .pipe(uglify())
        .pipe(concat('app.min.js'))
        .pipe(sourceMaps.write())
        .pipe(gulp.dest('public_html/js/'));
});

// Rerun the task when a file changes
gulp.task('watch', function() {
    gulp.watch(jsFiles, ['compile-js']);
    gulp.watch(cssFiles, ['compile-css']);
});