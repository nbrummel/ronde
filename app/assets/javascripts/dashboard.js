$(document).ready( function() {
	$('#all-events').toggle(false);
	$('#all-invitations').toggle(false);

	$('#recent_events').click( function() {
		$('#all-invitations').toggle(false);
		$('#all-events').toggle();
	});

	$('#invitations').click( function() {
		$('#all-events').toggle(false);
		$('#all-invitations').toggle();
	});
});