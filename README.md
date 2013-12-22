casperjs-screenshots
====================

Script for having both PhantomJS & SlimerJS Screenshots in a responsive way.

Install
-------

<pre>
$ npm install async
</pre>

Please See [Note](1)

Settings
--------

Edit settings.json as needed:

<pre>
{
  "url2render": "http://example.com/",
  "format": ".png",
  "viewport": [[320, 480], [480, 320], [960, 640], [640, 960], [1136, 960], [960, 1136], [1440, 900], [1920, 1080], [2048, 1536], [1536, 2048]]
}
</pre>

### Where

+ url2render: Screenshot this page.
+ format: 
+ viewport: Array containing viewport sets: [width, height]

Usage
-----

** Both PhantomJS (Webkit) and SlimerJS (Firefox) screenshots **

<pre>
$ casperjs screenshots.coffee settings.json && casperjs --engine=slimerjs screenshots.coffee settings.json
</pre>

** PhantomJS (Webkit) screenshots **

<pre>
$ casperjs screenshots.coffee settings.json
</pre>

** SlimerJS (Firefox) screenshots **

<pre>
$ casperjs --engine=slimerjs screenshots.coffee settings.json
</pre>


### Note
_____
There seems to be a bug in slimerJS, no relative require calls to "async" where possible. Absolute paths must be added using.
Son this *exception* is been considered.

<pre>
require.paths.push()
</pre>

### Thanks everyone.
(node, npm, phantom, slimer and casper crew!)
