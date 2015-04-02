/* global FontFaceObserver */
tg.fonts = (function () {
	'use strict';

	var initialize = function () {

		var $html = $('html');

		// if the class is already set, we're good.
		if($html.hasClass('fonts-loaded')) { return; }

		//otherwise, load custom fonts
		var fontA = new FontFaceObserver('LeagueGothicReg', {});

		$.when(fontA.check())
			.then(function() {
				$html.addClass('fonts-loaded');
			});

	};

	return {
		init: initialize
	};

})();