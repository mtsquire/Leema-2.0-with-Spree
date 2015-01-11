// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
	if ($(".section-cover").length > 0) {
		var sectionCoverWidth = $(".section-cover").width(),
			sectionCoverHeight = sectionCoverWidth / 3;

		$(".section-cover").css("height", sectionCoverHeight);
	}
});