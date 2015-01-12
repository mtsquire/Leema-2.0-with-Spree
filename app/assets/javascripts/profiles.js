// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

	// calculate height of video container after resize of browser window
	function doneResizingProfile(){

		var newWidth = getViewport()[0],
				newHeight = getViewport()[1];

		// after resizing, does the new width match the old one?
		if (newWidth != viewPortWidth) {


				var sectionCoverHeight = newWidth / 3;

				$(".section-cover").css("height", sectionCoverHeight);

		}

		// reset globals
		viewPortHeight = newHeight;
		viewPortWidth = newWidth;

	}



	// calculate height of video container at 16:9 ratio
	if ($(".section-cover").length > 0) {

	  var viewPortWidth = getViewport()[0],
	    	viewPortHeight = getViewport()[1],
				sectionCoverHeight = viewPortWidth / 3;

			$(".section-cover").css("height", sectionCoverHeight);

			var profileResizeTimeout;
	    $(window).on('resize',function(){
	      clearTimeout(profileResizeTimeout);
	      profileResizeTimeout = setTimeout(doneResizingProfile, 1000);
	    });

	  } else {

	  }


});
