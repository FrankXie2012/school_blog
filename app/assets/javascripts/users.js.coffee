jQuery ->
	$('.set-to-common-user').click ->
		$.ajax
			url: '/admins/set_to_common_user'
			type: 'GET'
			dataType: 'script'
			data: $(this).val
	$('.show-details').click ->
		if $('.details').hasClass('hidden')
			$('.details').removeClass('hidden')
		else
			$('.details').addClass('hidden')