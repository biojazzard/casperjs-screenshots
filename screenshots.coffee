###
Requires: phantomjs, slimerjs or casperjs + async

Usage: 

phantomJS:

$ phantomjs screenshots.coffee

slimerJS:

$ slimerjs screenshots.coffee

casperJS with phantomJS:

$ casperjs screenshots.coffee

casperJS with slimerJS:

$ casperjs --engine=slimerjs screenshots.coffee

Both Systems Screenshots:

$ casperjs screenshots.coffee && casperjs --engine=slimerjs screenshots.coffee
###

#Settings

# Some Login to normalize phantom & casper
casper = require("casper").create()
casper.echo "Casper CLI passed args:"
require("utils").dump casper.cli.args

# console.log phantom.args[3]

platform = undefined

if require.paths
  # Not working relative paths
  #require.paths.push('~/.npm/async/0.2.9/package/lib');
  # OK. Absolute path Please!
  require.paths.push('/Users/tallerdelsoho/Dropbox/Sites/github.com/casperjs-screenshots/node_modules/async/lib');
  platform = 'FF'
else
  platform = 'Webkit'

fs = require('fs');
async = require('async')

if phantom.args.length is 0
  # Default Settings
  type = '.png'
  papersize = 'A4'
  viewport = [[320, 480], [480, 320], [960, 640], [640, 960], [1136, 960], [960, 1136], [1440, 900], [1920, 1080], [2048, 1536], [1536, 2048]]
  url2render = 'http://n32.es/'
else 
  # Load setiings
  try
    #f = fs.read(phantom.args[3])
    f = fs.read(casper.cli.args[0])

  catch e
    console.log e
  
  screenshots = JSON.parse(f)
  #require("utils").dump screenshot

  # Loaded Settings
  type = screenshots.type
  viewport = screenshots.viewport
  papersize = screenshots.papersize
  url2render = screenshots.url2render

screenshot = (viewport, callback) ->
  # Load 
  page = require('webpage').create()
  # Change Viewport Size
  page.viewportSize =
    width: viewport[0]
    height: viewport[1]

  if type == '.pdf'
    paperdimensions = papersize.split 'x'

    if paperdimensions.length is 2
      page.paperSize = { width: paperdimensions[0], height: paperdimensions[1], border: '0' }
    else
      page.paperSize = { format: papersize, orientation: 'portrait', border: '1cm' }

  else
    page.zoomFactor = 1

  filename = platform + '_' + viewport[0] + 'x' + viewport[1] + type

  page.onLoadFinished = (status) ->
    # Exit with Error
    phantom.exit 1 if status isnt 'success'
    # Go on with the screenshot
    setTimeout (->
      page.render './_screenshots/' + filename
      page.close()
    ), 8000
    # Wait a moment!
    setTimeout (->
      callback.apply()
      console.log 'Done > ' + filename
    ), 1618

  # open it
  page.open url2render

# Very nice 
async.eachSeries viewport, screenshot, (e) ->
  console.log e if e
  console.log 'done!'
  phantom.exit()
