gulp = require 'gulp'
sass = require 'gulp-ruby-sass'
plumber = require 'gulp-plumber'
config = require './../config'

# compile sass files
gulp.task 'sass', ->
  gulp.src config.sass.src
    .pipe plumber()
    .pipe sass
      style: 'expanded'
    .pipe gulp.dest config.sass.dest
