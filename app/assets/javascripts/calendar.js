$(document).ready(function(){
   
   $('#calendar').fullCalendar({
	    
	 	dayClick: function(date) {

	     	var a = {date: date.format()};
	        $.get('dashboard/booking',a,function(response){
		 	});
    	}
	});
});
