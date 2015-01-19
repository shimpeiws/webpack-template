gulp = require 'gulp'
mainBowerFiles = require 'main-bower-files'
config = require './../config'

# copy bower_components
gulp.task 'bower', ->
  gulp.src mainBowerFiles()
    .pipe (gulp.dest config.bower.dest)
