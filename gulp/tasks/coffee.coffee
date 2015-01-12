gulp = require 'gulp'
coffee = require 'gulp-coffee'
plumber = require 'gulp-plumber'
config = require './../config'

# compile coffee files
gulp.task 'coffee', ->
  gulp.src config.coffee.src
    .pipe plumber()
    .pipe coffee
      bare: true
    .pipe gulp.dest config.coffee.dest
