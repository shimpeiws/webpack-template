gulp = require 'gulp'
coffee = require 'gulp-coffee'
plumber = require 'gulp-plumber'
webpack = require 'gulp-webpack'
gulpif = require 'gulp-if'
uglify = require 'gulp-uglify'
config = require './../config'

# compile to js using webpack
gulp.task 'webpack', ->
  gulp.src config.webpack.entry
    .pipe plumber()
    .pipe webpack config.webpack
    .pipe gulpif config.js.uglify, uglify()
    .pipe gulp.dest config.js.dest
