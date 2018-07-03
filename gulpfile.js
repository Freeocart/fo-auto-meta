const gulp = require('gulp');

gulp.task('mktest', () => {
  gulp.src('./upload/**')
      .pipe(gulp.dest('../oc2/'));
});

gulp.task('default', ['mktest'], () => {
  gulp.watch('./upload/**', () => {
    gulp.start('mktest');
  });
});