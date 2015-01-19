gulp = require 'gulp'
coffee = require 'gulp-coffee'
requireDir = require 'require-dir'
path = require 'path'
config = require './gulp/config'

requireDir './gulp/tasks', { recurse: true }

gulp.task 'watch', ->
  gulp.watch [config.file.appCoffee, config.file.appCoffeeLib, config.file.appSass], ['webpack', 'sass', 'coffee']

gulp.task 'default', ->
  gulp.run ['bower', 'webpack', 'sass', 'coffee']
