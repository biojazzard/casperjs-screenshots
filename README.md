casperjs-screenshots
====================

Script for having both PhantomJS & SlimerJS Screenshots in a responsive way.

Install
-------

<pre>
$ npm install async --save-dev
</pre>

### Important

Edit screenshots.coffee you match your async.js absolte path

Please See [Note][Note]

Settings
--------

Edit settings.json as needed:

<pre>
{
  "url2render": "http://n32.es",
  "type": ".pdf",
  "papersize": "A4",
  "viewport": [[320, 480], [480, 320], [960, 640], [640, 960], [1136, 960], [960, 1136], [1440, 900], [1920, 1080], [2048, 1536], [1536, 2048]]
}
</pre>

### Where

+ url2render: Screenshot this page.
+ format: '.png' or '.pdf'
+ papersize: only applicable when format is pdf. Admited values:
    * Simple Values: 'A4', 'B6'
    * Dimensions: '21cmx21cm', '4000ptx6000pt'
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
[Note]: There seems to be a bug in slimerJS, no relative require calls to "async" where possible. Absolute paths must be added using.
Son this *exception* is been considered.

<pre>
require.paths.push()
</pre>

### Thanks everyone.
(node, npm, phantom, slimer and casper crew!)
