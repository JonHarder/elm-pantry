var gulp = require('gulp');
var elm = require('gulp-elm');
var plumber = require('gulp-plumber');
var connect = require('gulp-connect');


var paths = {
    dest: 'dist',
    destGlob: 'dist/*',
    elm: 'src/*.elm',
    staticAssets: 'src/*.{html,css}',
};


gulp.task('elm-init', elm.init);

gulp.task('elm', ['elm-init'], () => {
    return gulp.src(paths.elm)
        .pipe(plumber())
        .pipe(elm())
        .pipe(gulp.dest(paths.dest));
});


gulp.task('static', () => {
    return gulp.src(paths.staticAssets)
        .pipe(plumber())
        .pipe(gulp.dest(paths.dest));
});

gulp.task('watch', () => {
    // re-run build tasks when files change
    gulp.watch(paths.elm, ['elm']);
    gulp.watch(paths.staticAssets, ['static']);

    // live reload when any dist files change
    gulp.watch(paths.destGlob, () => {
        return gulp.src(paths.dest)
            .pipe(connect.reload());
    });
});


gulp.task('client', () => {
    connect.server({
        root: 'dist',
        port: 8080,
        livereload: true,
    });
});


gulp.task('build', ['elm', 'static']);
gulp.task('default', ['client', 'build', 'watch']);
