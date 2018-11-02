/* ticker tape for vintage motorcyle on events page */

<!-- type = "text/javascript" -->
		// Create a "ticker-tape" effect by sliding the 
		// paragraph of text one pixel to the right, 
		// over and over, until the right-hand limit of  
		// 300 pixels is reached. At that point, restart 
		// the animation all the way to the left.
	function move_paragraph() {
		next = current + "px";
		current += 1;
		if (current > 550) {
			current = 0;
		}
		paragraph.style.left = next;
			
		//Pause for 18 ms before next move
		var rate = 50;
		setTimeout(move_paragraph, rate);
	}

		//this function calls the animation function
		//and applies it to the <p id="original"> 
	function init() {
		paragraph = document.getElementById("original");
		paragraph.style.position = "absolute";
		current = 0;
		move_paragraph();
	}
