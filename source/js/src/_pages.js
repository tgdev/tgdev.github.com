/* global smoothState */
tg.pages = (function () {
	'use strict';

	var initialize = function () {

		var content = $('#js-smooth-state').smoothState({
			// onStart runs as soon as link has been activated
			onStart : {
				// Set the duration of our animation
				duration: 250,
				// Alterations to the page
				render: function (url, $container) {
					console.log('SS rending page smoothly');
					console.log('SS url: ',url);
					console.log('SS container: ', $container);
					// Quickly toggles a class and restarts css animations
					content.toggleAnimationClass('is-exiting');
				}
			}
		}).data('smoothState'); // makes public methods available

	};

	return {
		init: initialize
	};

})();