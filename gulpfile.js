var gulp = require('gulp'), 
    bower = require('gulp-bower'),
    replace = require('gulp-replace');

var config = {
  bowerDir: './bower_components',
  buildDir: './build/assets'
};

gulp.task('bower', function() {
  return bower()
});

gulp.task('jquery', ['bower'], function() {
  gulp.src(config.bowerDir + '/jquery/dist/jquery.js')
      .pipe(gulp.dest(config.buildDir + '/jquery/javascripts'));
});

gulp.task('modernizr', ['bower'], function() {
  gulp.src(config.bowerDir + '/modernizr/modernizr.js')
      .pipe(gulp.dest(config.buildDir + '/modernizr/javascripts'));
});

gulp.task('respond', ['bower'], function() {
  gulp.src(config.bowerDir + '/respond/dest/respond.src.js')
      .pipe(gulp.dest(config.buildDir + '/respond/javascripts'));
});

gulp.task('bootstrap-sass', ['bower'], function() {
  gulp.src(config.bowerDir + '/bootstrap-sass/assets/stylesheets/**/*.scss')
      .pipe(gulp.dest(config.buildDir + '/bootstrap-sass/stylesheets'))

  gulp.src(config.bowerDir + '/bootstrap-sass/assets/javascripts/**/*.js')
      .pipe(gulp.dest(config.buildDir + '/bootstrap-sass/javascripts'))

  gulp.src(config.bowerDir + '/bootstrap-sass/assets/fonts/**/*.{eot,svg,ttf,woff,woff2}')
      .pipe(gulp.dest(config.buildDir + '/bootstrap-sass/fonts'));
});

gulp.task('fontawesome', ['bower'], function() {
  gulp.src(config.bowerDir + '/fontawesome/scss/*.scss')
     .pipe(replace(/url\(\'.+?\/(fontawesome-webfont.(eot|svg|ttf|woff2?)).+?'\)/g, 'font-url(\'$1\')'))
     .pipe(gulp.dest(config.buildDir + '/fontawesome/stylesheets'))

  gulp.src('bower_components/fontawesome/fonts/*.{eot,svg,ttf,woff,woff2}')
      .pipe(gulp.dest(config.buildDir + '/fontawesome/fonts'));
});

gulp.task('default', [
  'bower',
  'jquery',
  'modernizr',
  'respond',
  'bootstrap-sass',
  'fontawesome'
]);
