const gulp = require('gulp');

function mktest () {
  return gulp.src('./upload/**')
    .pipe(gulp.dest('../oc2/'))
}

function watchMkTest () {
  return gulp.watch('./upload/**', mktest)
}

gulp.task('mktest', mktest);
gulp.task('default', gulp.series(mktest, watchMkTest));