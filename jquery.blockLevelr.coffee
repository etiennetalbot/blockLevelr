# blockLevelr jQuery Plugin
# A plugin for equalizing the height of blocks
# version 1.0, May 19th, 2013
# by Etienne Talbot

jQuery.fn.blockLevelr = (settings) ->
  
  # default config values
  config =
    minHeight: 0      # Minimal OUTER height of the columns
    perRow:    0      # Number of elements per row
    emBase:    false  # Set the base pixel value of 1em (false if output is in pixels)
  
  jQuery.extend(config, settings) if settings
  
  columns = null

  # Initialize the plugin
  init = =>
    columns = jQuery this
    heightCheck()

    return
  
  # Check the height of each element and set a target for each row
  heightCheck = ->
    numRow =               0
    targetHeight =         new Array()
    targetHeight[numRow] = config.minHeight

    for column, i in columns
      if columns.eq(i).outerHeight() > targetHeight[numRow]
        targetHeight[numRow] = columns.eq(i).outerHeight()
      if (i + 1) % config.perRow is 0
        numRow++
        targetHeight[numRow] = config.minHeight
    
    heightChange targetHeight

    return
  
  # Change the height of the elements
  heightChange = (targetHeight) ->
    numRow =           0
    individualTagret = 0
    
    for column, i in columns
      if columns.eq(i).css('box-sizing') is 'content-box'
        individualTarget = targetHeight[numRow] - (columns.eq(i).outerHeight() - columns.eq(i).height())
      else
        individualTarget = targetHeight[numRow]
      
      if config.emBase isnt false
        columns.eq(i).css 'height', "#{individualTarget/config.emBase}em"
      else
        columns.eq(i).css 'height', "#{individualTarget}px"
      
      if (i + 1) % config.perRow is 0
        numRow++
    
    return
  
  # Recheck the height of elements for changes (can be called afterwards)
  @recheck = ->
    columns.css 'height', 'auto'
    heightCheck()
    
    return
  
  init()
  
  return this