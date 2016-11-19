axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
browserify   = require 'roots-browserify'
babelify     = require 'babelify'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

  output: 'public'

  extensions: [
    browserify(
      files: "assets/js/main.js",
      out: 'js/build.js'
      transforms: babelify.configure({ 
        presets: ["es2015"] 
      })
      ),
    
    css_pipeline(
      files: 'assets/css/*.styl'
      )
  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]
    sourcemap: true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true
