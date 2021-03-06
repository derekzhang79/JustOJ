var gulp            = require('gulp');
var rename          = require('gulp-rename');
var browserify      = require('browserify');
var livereload      = require('gulp-livereload');
var source          = require('vinyl-source-stream');
var glob            = require('glob');
var nodemon         = require('gulp-nodemon');
var notify          = require('gulp-notify');


var args = require('yargs').argv;
var nodeInspector = require('gulp-node-inspector');


gulp.task('test', function() {

    var testFiles = glob.sync('./test/**/*.js');

    return browserify({
        entries: testFiles
    })
        .bundle()
        .pipe(source('test-build.js'))
        .pipe(gulp.dest('build'));

});

gulp.task('test-view', ['test'], function() {
    return gulp.src('test/index.html')
        .pipe(livereload());
});


gulp.task('watch', function() {
    livereload.listen();
    gulp.watch('./test/**/*.js', ['test-view']);
});



gulp.task('debug', function () {

    gulp
        .src(['bin/www'])
        .pipe(nodeInspector({
            debugPort: 5858,
            webHost: 'localhost',
            webPort: 8080,
            preload: false
        }));
});


gulp.task('dev', (args.debug) ? ['debug'] : null, function () {

    livereload.listen();

    var options = {
        script: 'bin/www',
        ext: 'ejs js',
        exec: 'sudo node  ',
        nodeArgs: []
    };

    if (args.debug) {
        options.nodeArgs.push('--debug');
    }


    nodemon(options)
        .on('crash', function () {
            console.log('script crashed for some reason');
        })
        .on('restart', function () {
            gulp.src('bin/www')
                .pipe(livereload());
                //.pipe(notify('Page Reloading...'));
        });

});