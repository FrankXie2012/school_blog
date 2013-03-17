jQuery ->
	$('.add-comment').click ->
		if $('.comment-form').hasClass('hidden')
			$('.comment-form').removeClass('hidden')
		else
			$('.comment-form').addClass('hidden')