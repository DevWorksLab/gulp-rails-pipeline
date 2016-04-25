var gulp = require('gulp');
var uglify = require('gulp-uglify');
var config = require('../config').js;
var sourcemaps = require('gulp-sourcemaps');
var handleErrors = require('../util/handleErrors');
var browserSync = require('browser-sync');
var concat = require('gulp-concat');

gulp.task('scripts', function () {
  return gulp.src(config.src)
    .pipe(sourcemaps.init())
    .pipe(concat('application.js'))
    .on('error', handleErrors)
    .pipe(gulp.dest(config.dest))
    .pipe(uglify())
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(config.dest))
    .pipe(browserSync.reload({stream:true}));
  });
