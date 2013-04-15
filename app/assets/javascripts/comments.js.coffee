jQuery ->
  $(".show-comments").click ->
    if $(this).closest('thead').next().hasClass('hidden')
      $(this).closest('thead').next().removeClass('hidden')
    else
      $(this).closest('thead').next().addClass('hidden')