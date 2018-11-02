/*  accordion */

$(document).ready(function() {
	$('#accordion').accordion({
		active: false,
		collapsible: true,
		icons: {
			header: "ui-icon-plusthick",
			activeHeader: 'ui-icon-closethick'
		},
		animate: false
	}); // end accordion
}); // end ready