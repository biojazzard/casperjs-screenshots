casperjs-screenshots
====================

Script for having both PhantomJS &amp; SlimerJS in a responsive way.

Usage
-----

Edit screenshots.json as needed.

Terminal

** Both PhantomJS (Webkit) and SlimerJS (Firefox) screenshots **

<pre>
$ casperjs screenshots.coffee && casperjs --engine=slimerjs screenshots.coffee
</pre>

** Both PhantomJS (Webkit) screenshots **

<pre>
$ casperjs screenshots.coffee screenshots.json
</pre>

** SlimerJS (Firefox) screenshots **

<pre>
$ casperjs --engine=slimerjs screenshots.coffee screenshots.json
</pre>

Thank You everyone.
(node, npm, javascript scene, phantom, slimer and casper crew!)


** Note: **
_____
There seems to be a bug in slimerJS, no relative require calls to "async" where possible. Absolute paths must be added using:

<pre>
require.paths.push()
</pre>
