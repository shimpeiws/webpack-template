gulp = require 'gulp'
coffee = require 'gulp-coffee'
requireDir = require 'require-dir'
path = require 'path'
config = require './gulp/config'

requireDir './gulp/tasks', { recurse: true }

gulp.task 'watch', ->
  gulp.watch [config.coffee.src, config.sass.src], ['webpack', 'sass']

gulp.task 'default', ->
  gulp.run ['webpack', 'sass']
