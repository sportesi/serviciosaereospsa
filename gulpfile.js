/**
 * Created by sebastian on 19/01/17.
 */

var gulp = require('gulp');
var concat = require('gulp-concat');
var cleanCss = require('gulp-clean-css');

gulp.task('default', ['compile-css']);

var css = [
    'node_modules/bootstrap/dist/css/bootstrap.css',
    'node_modules/bootstrap-sweetalert/dist/sweetalert.css',
    '/home/sebastian/projects/serviciosaereospsa/node_modules/select2/dist/css/select2.css',

];

gulp.task('compile-css', function () {
    return gulp.src(css)
        .pipe(concat('app.css'))
        .pipe(cleanCss())
        .pipe(gulp.dest('public_html/css/'));
});