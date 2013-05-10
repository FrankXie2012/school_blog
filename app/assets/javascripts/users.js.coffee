jQuery ->
  $('#cropbox').Jcrop()
  $ ->
    $(".autocomplete-search").autocomplete
      source: (request, response) ->
        $.ajax
          url: '/posts/autocomplete_search'
          type: 'GET',
          dataType: "json",
          data:
            term: request.term
          success: (data) ->
            response $.map(data,(item) ->
              {
                label: item.label
                id: item.id
              }
            )
      select: (event, ui) ->
        window.location.href = '/posts/' + ui.item.id