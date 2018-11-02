<!-- Trash It! -->

$(document).ready(function() {
	$('#photos img').draggable({
		revert : "invalid",
		
		start : function (event, ui) {
			ui.helper.css('transform', 'rotate(5deg) scale(1.5)');
		},
		
		stop : function (event, ui) {
			ui.helper.css('transform', 'rotate(0deg) scale(1)');
		},

		zIndex : 100				
	}); // end draggable
	
	//drop the dragged photo into the trash can
	$('#trashcan').droppable({
		activeClass : 'highlight',
		
		//drop event handler with a function
		drop : function (event, ui) {
			ui.helper.hide('explode');
			$(this).attr('src','images/trash_it/trashcan-full-icon.png');
		}
	}); // end droppable	
}); // end ready
