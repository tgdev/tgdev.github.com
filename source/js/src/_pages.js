/* global smoothState */
tg.pages = (function () {
	'use strict';

	var initialize = function () {

		var $body = $('html, body'),
			content = $('#main').smoothState({
				prefetch: true,
	            pageCacheSize: 4,
				// onStart runs as soon as link has been activated
				onStart : {
					// Set the duration of our animation
					duration: 250,
					// Alterations to the page
					render: function (url, $container) {
						// Quickly toggles a class and restarts css animations
						content.toggleAnimationClass('is-exiting');
						$body.animate({
                        	scrollTop: 0
                    	});
					}
				}
			}).data('smoothState'); // makes public methods available

	};

	return {
		init: initialize
	};

})();