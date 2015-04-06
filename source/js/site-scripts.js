// Site javascript file

// Libs
//= require libs/_jquery-1.11.1-custom.js

// Plugins
//= require plugins/_console.js
// require plugins/_fontfaceobserver.js
//= require plugins/_smoothState.js

//= require _namespace.js
//= require _common.js
// require src/_fonts.js

(function($) {

	'use strict';

	// if(w.document.documentElement.className.indexOf('fonts-loaded') > -1) {
	// 	return;
	// }

	// var fontA = new w.FontFaceObserver('LeagueGothicReg', {});

	// w.Promise
	// 	.all([fontA.check()])
	// 	.then(function(){
	// 		w.document.documentElement.className += ' fonts-loaded';
	// 	});

	$(function() {

		'use strict';

		tg.common.init();
		// tg.fonts.init();

	});

})(jQuery);