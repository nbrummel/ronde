$(document).ready( function() {
	$('#sign-in-box').toggle(false);
	$('#sign-up-box').toggle(false);
	$('#show-session-links').toggle(false);
	$('#sign-in').click( function() {
		$('#session-links').toggle();
		$('#show-session-links').fadeIn(700);
		$('#sign-in-box').fadeIn(300);
	});
	$('#sign-up').click( function() {
		$('#session-links').toggle();
		$('#show-session-links').fadeIn(700);;
		$('#sign-up-box').fadeIn(300);
	});
	$('#show-session-links').click( function() {
		$('#session-links').toggle(true);
		$('#show-session-links').toggle(false);
		$('#sign-in-box').toggle(false);
		$('#sign-up-box').toggle(false);
		$("html, body").animate({ scrollTop: 0 }, "slow");
	});
});

