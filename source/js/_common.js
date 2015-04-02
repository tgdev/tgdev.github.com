/**
 * @Common Sitewide Scripts
 */

tg.common = {

	init: function() {

		// setup fitvids plugin
		$('.article__content').fitVids();

		// page transitions
		var content  = $('#js-smooth-state').smoothState({
        	// onStart runs as soon as link has been activated
        	onStart : {

          		// Set the duration of our animation
          		duration: 250,

          		// Alterations to the page
          		render: function () {

            		// Quickly toggles a class and restarts css animations
            		content.toggleAnimationClass('is-exiting');
          		}
        	}
		}).data('smoothState'); // makes public methods available

	}
};