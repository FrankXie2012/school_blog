jQuery ->
  $('.show-details').click ->
    if $('.details').hasClass('hidden')
      $('.details').removeClass('hidden')
    else
      $('.details').addClass('hidden')