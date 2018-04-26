//==============================================================================
//
//================== PATH PARAMETERS
//
//==============================================================================

var themePath = 'path/to/template/files/';

var cssSrc = [themePath + 'css/unbuild/*.css', themePath + 'css/unbuild/*.scss'];
var cssDest = themePath + 'css/minified/';

var jsSrc = themePath + 'js/unbuild/*.js';
var jsDest = themePath + 'js/minified/';


//==============================================================================
//
//================== DEPENDENCIES
//
//==============================================================================

var gulp = require('gulp');
var sass = require('gulp-sass');
var minifyJs = require('gulp-uglify');
var rename = require("gulp-rename");

var fs = require('fs');
if (1) fs.chmod = function (a, b, cb) {
    cb(0);
}


//==============================================================================
//
//================== BUILD JOBS
//
//==============================================================================

gulp.task('listen', function() {
    var cssWatcher = gulp.watch(cssSrc, ['buildCss']);
	var jsWatcher = gulp.watch(jsSrc, ['buildJs']);
	
	cssWatcher.on('change', function(event) {
		console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
	});
	
	jsWatcher.on('change', function(event) {
		console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
	});
});

gulp.task('build', function() {
	gulp.start('buildCss');
	gulp.start('buildJs');
});

gulp.task('buildCss', function() {
    return gulp.src(cssSrc)
        .pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
        .pipe(rename(function (path) {
            path.basename += ".min";
        }))
        .pipe(gulp.dest(cssDest));
});

gulp.task('buildJs', function() {
	return gulp.src(jsSrc)
        .pipe(minifyJs())
        .pipe(rename(function (path) {
            path.basename += ".min";
        }))
        .pipe(gulp.dest(jsDest));
});