gulp = require 'gulp'
coffee = require 'coffee-loader'
webpack = require 'webpack'
path = require 'path'

dest = './build'
src = './src'

files =
  coffee: src + '/coffee/**/*.coffee'
  sass: src + '/sass/**/*.scss'

dest =
  js: dest + '/js'
  css: dest + '/css'

module.exports =

  # 出力先の設定
  dest: dest

  js:
    src: src + '/js/**',
    dest: dest.js,
    uglify: false

  # coffeeのコンパイル
  coffee:
    src: files.coffee
    dest: dest.js

  # sassのコンパイル
  sass:
    src: files.sass
    dest: dest.css

  # webpackのビルド
  webpack:
    entry: src + '/coffee/app.coffee'
    output:
      filename: 'bundle.js'
    module:
      loaders: [
        {test: /\.coffee$/, loader: 'coffee'}
      ]
    resolve:
      extensions: ['', '.js', '.coffee']
      root: [path.join(__dirname, "bower_components")]
      modulesDirectories: ['node_modules', 'bower_components']
    plugins: [
      new webpack.ResolverPlugin([
        new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin('bower.json', ['main'])
      ]),
      new webpack.ProvidePlugin
        $: 'jquery'
        _: 'lodash'
        React: 'react'
    ]
