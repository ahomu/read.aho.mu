$ ->

  #============================
  # Columns

  $(window).resize ->

    width = $(window).width()

    if width > 1440
      document.body.className = 'column5'
    else if width >= 1280
      document.body.className = 'column4'
    else if width >= 1024
      document.body.className = 'column3'
    else if width >= 768
      document.body.className = 'column2'
    else# if width >= 640
      document.body.className = 'column1'

  $(window).resize()

  #============================
  # Spinner

  $spinner = $('#js_spinner')

  $(document).on 'click', '.js_entry_link', ->
    $spinner.appendTo($(this).parent())

  window.addEventListener 'pagehide', ->
    $spinner.appendTo('body')
  , false

  #============================
  # nav
  $('#js_show_nav').on 'click', ->
    $(this).parent().remove()
    $('#nav').fadeIn(200)
    return false

  #============================
  # clip
  $(document).on 'ajax:success', '.clip', (evt, resp)->
    $btn = $(this)
    $btn.removeClass 'clip'
    $btn.addClass 'clipped'
    $btn.data 'method', 'delete'
    $btn.attr 'href', '/clips/'+resp.id

  $(document).on 'ajax:success', '.clipped', (evt, resp)->
    $btn = $(this)
    $btn.removeClass 'clipped'
    $btn.addClass 'clip'
    $btn.data 'method', 'post'
    $btn.attr 'href', '/clips?entry_id'+resp.entry_id

