gulp = require 'gulp'
coffee = require 'coffee-loader'
webpack = require 'webpack'
path = require 'path'

appPath = './itemlist-react/'

appAssetPath = 'app/assets/'

files =
  appCoffee: appPath + appAssetPath + 'javascripts/src/**/*.coffee'
  appCoffeeLib: appPath + appAssetPath + 'javascripts/lib/**/*.coffee'
  appSass: appPath + appAssetPath + 'stylesheets/src/**/*.scss'
  appSassLib: appPath + appAssetPath + 'stylesheets/lib/**/*.scss'

dest =
  js: appPath + appAssetPath + 'javascripts/src'
  jsLib: appPath + appAssetPath + 'javascripts/lib/'
  css: appPath + appAssetPath + 'stylesheets/src'
  cssLib: appPath + appAssetPath + 'stylesheets/lib'

module.exports =

  # 入力
  file: files

  # 出力先
  dest: dest

  # bower
  bower:
    dest: dest.jsLib + 'bower_components'

  # coffeeのコンパイル
  coffee:
    src: files.appCoffee
    dest: dest.js

  # sassのコンパイル
  sass:
    src: files.appSass
    dest: dest.css

  # webpackのビルド
  webpack:
    entry: appPath + appAssetPath + 'javascripts/lib/main.coffee'
    output:
      filename: 'app.js'
    module:
      loaders: [
        {test: /\.coffee$/, loader: 'coffee'}
      ]
    resolve:
      extensions: ['', '.js', '.coffee']
      root: [path.join(__dirname, 'bower_components')]
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
