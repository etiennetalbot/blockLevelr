blockLevelr
===========

CoffeeScript plugin to make blocks of content the same height as eachothers.

Requirements
------------

This plugin requires jQuery



Parameters
----------

### minHeight
*(integer)* - The minimum height of the blocks. Do not write 'px' or 'em'… it will be done by the plugin

### perRow
*(integer)* - Number of blocks per row. If specified, the blocks will adapt to their own rows. If not, the block will all adapt together regardless of the row they are in.

### emBase
*(integer)* - Set the base pixel value of 1em. If specified, output will be in 'em'. If not, output will be in 'px'

Methods
-------

### recheck()
Check the height of the elements again and resize them
    
    blockLevelrVariable.recheck()


Usage
-----
### JavaScript
	var blockLevelrVariable = $('.level').blockLevelr({
	  minHeight: 300,
	  perRow: 3,
	  emBase: 16
	});

### CoffeeScript
	blockLevelrVariable = $('.level').blockLevelr
	  minHeight: 300
	  perRow: 3
	  emBase: 16