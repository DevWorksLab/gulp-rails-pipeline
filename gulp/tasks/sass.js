var gulp         = require('gulp');
var browserSync  = require('browser-sync');
var sass         = require('gulp-sass');
var sourcemaps   = require('gulp-sourcemaps');
var handleErrors = require('../util/handleErrors');
var config       = require('../config').sass;
var autoprefixer = require('gulp-autoprefixer');

var postcss = require('gulp-postcss');
var cssImport = require('postcss-import');
var url = require("postcss-url");
// Note, that you must set postcss-mixins plugin before postcss-simple-vars and postcss-nested.
var mixins = require('postcss-mixins');
var simpleVars = require('postcss-simple-vars');
var nested = require('postcss-nested');
var cssnext = require("postcss-cssnext");
var mqpacker = require('css-mqpacker');
var cssnano = require('cssnano');
var sourcemaps = require('gulp-sourcemaps');
var browserReporter = require("postcss-browser-reporter");
var reporter = require("postcss-reporter");
var lost = require('lost');
// var fontMagician = require('postcss-font-magician');
var gutil = require('gulp-util');
var source = require('vinyl-source-stream');
var browserify = require('browserify');
var nunjucksRender = require('gulp-nunjucks-render');
var data = require('gulp-data');
var processor = postcss();

gulp.task('sass', function () {
    var processors = [
      cssImport,
      autoprefixer({browsers: ['last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4']}),
      cssnano,
      mixins,
      simpleVars,
      nested,
      mqpacker,
      browserReporter,
      reporter,
      // fontMagician({ hosted: '../src/fonts' }),
      cssnext,
      lost
  ];

  return gulp.src(config.src)
    .pipe(sourcemaps.init())
    .pipe(sass(config.settings))
    .on('error', handleErrors)
    .pipe(processors.forEach(processor.use.bind(processor)))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(config.dest))
    .pipe(browserSync.reload({stream:true}));
});
