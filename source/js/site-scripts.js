// Site javascript file

// Libs
//= require libs/_jquery-1.11.1-custom.js

// Plugins
//= require plugins/_console.js
//= require plugins/_fontfaceobserver.js
//= require plugins/_smoothState.js

//= require _namespace.js
//= require src/_fonts.js
//= require src/_pages.js

;(function($) {

	'use strict';

	tg.fonts.init();
	tg.pages.init();

})(jQuery);