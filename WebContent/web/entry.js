/**
 * 
 */
seajs.config({
	'base':"./",
	'vars':{
		'language':"en"
	},
	'alias':{"app":"./src/app.js",'View':"src/core/View.js"},
	'paths': {
		'page':'src/page',
		'widget':'src/widget',
		'framework':'src/framework',
		'i18n':"src/i18n",
		'core':"src/core"
	},
	'charset': 'utf-8',
	'preload': [
	    Function.prototype.bind?"":"lib/ECMAScript5.js",
        "Zqy"
	]
});
seajs.use("app");