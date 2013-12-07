var showTooltip = function(event) {
   $('div.tooltip').remove();
   $('<div class="tooltip">I\' am tooltips! tooltips! tooltips! :)</div>')
     .appendTo('body');
   changeTooltipPosition(event);
};