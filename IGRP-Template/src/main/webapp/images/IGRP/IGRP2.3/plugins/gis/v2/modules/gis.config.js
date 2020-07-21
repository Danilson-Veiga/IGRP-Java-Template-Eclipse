(function(){

	GIS.module('Config', {
		
		getOptions : function(widget){
			
			var config = {
					
	            css: false, html: false, js: false
				
			}
						
			switch(widget){
				
			    case 'getcoordinates':
				case 'edition':
			    case 'measurement':
				case 'legend':
				case 'search':
				case 'timeslider':
					
					config.css = true; config.js = true;  config.html = true; 
					
					break;
							
				case 'selection_menu':
				case 'infowindow':
					
					config.css = true; config.js = true; 
					
					break;
					
				case 'attribute_render':
				case 'query_expression':
				
					config.js = true;
					
					break;
							
			}
						
			return config;
			
		},


	});

})();