$(document).ready( function() {

	// Hide all invisible divs
	$('#all-events').toggle(false);
	$('#all-invitations').toggle(false);
	$('#new-event').toggle(false);

	// Hide everything else, display only recent events.
	$('#recent_events').click( function() {
		$('#all-invitations').toggle(false);
		$('#new-event').toggle(false);
		$('#all-events').toggle();
	});

	// Display only the invitations
	$('#invitations').click( function() {
		$('#all-events').toggle(false);
		$('#new-event').toggle(false);
		$('#all-invitations').toggle();
	});

	// Display the field for creating a new event
	$('#new_event').click( function() {
		$('#all-events').toggle(false);
		$('#all-invitations').toggle(false);
		$('#time-select-start').toggle(false);
		$('#time-select-end').toggle(false);
		$('#event-type-select').toggle(false);
		$('#new-event').toggle();
	});

	// All functions below belong to creating a new event
	$('#event_event_type').focusin( function() {
		$('#time-select-start').toggle(false);
		$('#time-select-end').toggle(false);
		$('#event-select-type').toggle(true);
	});

	$('#event_event_type').focusout( function() {
		$('#time-select-end').toggle(false);
		$('#time-select-start').toggle(false);
		window.setTimeout(function() { $('#event-select-type').toggle(false) }, 150);
	});

	var roundMinutes = function(mins){
		if (mins > 0 && mins < 15){
			return '15';
		}
		else if (mins > 15 && mins < 30){
			return '30';
		}
		else if (mins > 30 && mins < 45){
			return '45';
		}
		else if (mins > 45 && mins < 60){
			return 'incr hour';
		}
		return mins
	}

	var generateTime = function(list, time, end) {
		var link;
		var currentDay = time.getDate();
		var currentMonth = time.getMonth();
		var currentYear = time.getFullYear();
		var currentHour = time.getHours();
		var currentMinute = roundMinutes(time.getMinutes());
		if (currentMinute == 'incr hour'){
			currentMinute = 0;
			currentHour += 1;
		}
		if(end){
			currentHour += 1;
		}
		var startTime;
		var endTime;
		var currentTime = new Date(currentYear,currentMonth,currentDay,currentHour,currentMinute,0,0);
		var defaultStartTime = new Date(currentYear,currentMonth,currentDay,4,0,0,0);
		var defaultEndTime = new Date(currentYear,currentMonth,currentDay+1,4,0,0,0);
		startTime = currentTime;

		if (end && currentHour >= 4){
			endTime = defaultEndTime;
			startTime = defaultStartTime;
		}
		else{
			endTime = new Date(time.getFullYear(),parseInt(time.getMonth()),parseInt(time.getDate()),4,0,0,0);
		}

		count = endTime.getHours() - startTime.getHours();
		count = Math.max(3,count);
		for(var j = 0; j < count; j++) {
			for(var i = startTime.getMinutes(); i < 60; i+=15){
				startTime = new Date(currentYear,currentMonth,currentDay,startTime.getHours(),i,0,0);
				timeString = startTime.toString("yyyy:MM:dd:HH:mm").split(':');
				timeHour = timeString[0].split(' ')[4];
				if (timeHour[0] == '0'){
					timeHour = timeHour[1]
				}
				timeMinute = timeString[1];
				format = 'AM';
				if (timeHour >= 12){
					format = 'PM';
				}
				
				if(end == true){
					link = $("<a href='#' id='" + "end-hour-" + timeHour + "-minute-" + timeMinute + "-format-" + format +  "-year-" + currentYear + "-day-" + currentDay + "-month-" + currentMonth + "'>" + timeHour+ ":" + timeMinute + " " + format + "</a>");
					link.appendTo(list);

				}
				else{
					link = $("<a href='#' id='" + "start-hour-" + timeHour + "-minute-" +  timeMinute + "-format-" + format + "-year-" + currentYear + "-day-" + currentDay + "-month-" + currentMonth + "'>" + timeHour + ":" + timeMinute + " " + format + "</a>");
					link.appendTo(list);
				}
				
			}
			startTime = new Date(currentYear,currentMonth,currentDay,startTime.getHours()+1,0,0,0);
		}
		return false;
	}

	var generateLinks = function(end) {
		if(end){
			$('#time-list-end').each( function() {
				$(this).each(function(){
					$(this.children).each( function() {
						$(this).click(function() {
							var time = this.id.split('-');
							$('#event_end').val('');
							$('#event_end').val(time[2] + ':' + time[4] + ' ' + time[6] + ' ' + time[8] + '-' + time[10] + '-' + time[12]);
							$('#event_end').attr('readonly',true);
						});
					});
				});
			});
		}
		else{
			$('#time-list-start').each( function() {
				$(this).each(function(){
					$(this.children).each( function() {
						$(this).click(function() {
							var time = this.id.split('-');
							$('#event_start').val('');
							$('#event_start').val(time[2] + ':' + time[4] + ' ' + time[6] + ' ' + time[8] + '-' + time[10] + '-' + time[12]);
							$('#event_start').attr('readonly',true);
						});
					});
				});
			});
		}
		return false;
	}

	$('#event_start').focusin( function() {
		$('#time-select-end').toggle(false);
		$('#event-select-type').toggle(false);
		$('#time-select-start').toggle(true);
		generateTime($('#time-list-start'), new Date($.now()), false);
		generateLinks(false);
	});

	$('#event_start').focusout( function() {
		$('#time-select-end').toggle(false);
		$('#event-select-type').toggle(false);
		window.setTimeout(function() { $('#time-select-start').toggle(false), $('#time-list-start').empty() }, 150);
	});

	$('#event_end').focusin( function() {
		$('#time-select-start').toggle(false);
		$('#event-select-type').toggle(false);
		$('#time-select-end').toggle(true);
		generateTime($('#time-list-end'), new Date($.now(1)), true);
		generateLinks(true);
	});

	$('#event_end').focusout( function() {
		$('#time-select-start').toggle(false);
		$('#event-select-type').toggle(false);
		window.setTimeout(function() { $('#time-select-end').toggle(false), $('#time-list-end').empty() }, 150);
	});

	$('#Food').click( function() {
		$('#event_event_type').val('');
		$('#event_event_type').val('Food');
		$('#event-type-select').toggle(false);
		$('#event_event_type').attr('readonly',true);
	});

	$('#Drink').click( function() {
		$('#event_event_type').val('');
		$('#event_event_type').val('Drink');
		$('#event-type-select').toggle(false);
		$('#event_event_type').attr('readonly',true);
	});

	$('#Other').click( function() {
		$('#event_event_type').val('');
		$('#event_event_type').val('Other');
		$('#event-type-select').toggle(false);
		$('#event_event_type').attr('readonly',true);
	});
});