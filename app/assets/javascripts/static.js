$(document).ready( function() {
	$('#sign-in-box').slideUp(0);
	$('#sign-up-box').slideUp(0);
	$('#show-session-links').slideUp(0);
	$('#sign-in').click( function() {
		$('#session-links').slideUp(0);
		$('#show-session-links').slideDown(0);
		$('#sign-in-box').slideDown();
	});
	$('#sign-up').click( function() {
		$('#session-links').slideUp(0);
		$('#show-session-links').slideDown(0);
		$('#sign-up-box').slideDown();
	});
	$('#show-session-links').click( function() {
		$('#session-links').slideDown(0);
		$('#show-session-links').slideUp(0);
		$('#sign-in-box').slideUp(0);
		$('#sign-up-box').slideUp(0);
	});
});

