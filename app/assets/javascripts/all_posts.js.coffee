jQuery ->
  $("*[data-link]").click ->
    window.location = $(this).data('link')