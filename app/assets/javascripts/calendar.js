$(document).ready(function(){
   
   $('#calendar').fullCalendar({
    
	 	dayClick: function(date) {
	     	var a = {date: date.format()};
	        $.get('events/new',a,function(response){
		 	});
    	},
        events: '/events.json',
        eventMouseover: function(calEvent, jsEvent) {
            var tooltip = '<div class="tooltipevent blog"><div class="blog-item"><div class="entry-meta"><span id="publish_date">'+ calEvent.title +'</span><span><i class="fa fa-comment"></i> <a href="#">'+ calEvent.description +'</a></span></div></div></div>';
            $("body").append(tooltip);
            $(this).mouseover(function(e) {
                $(this).css('z-index', 10000);
                $('.tooltipevent').fadeIn('500');
                $('.tooltipevent').fadeTo('10', 1.9);
            }).mousemove(function(e) {
                $('.tooltipevent').css('top', e.pageY + 10);
                $('.tooltipevent').css('left', e.pageX + 20);
            });
        },
        eventMouseout: function(calEvent, jsEvent) {
            $(this).css('z-index', 8);
            $('.tooltipevent').remove();
        },
        eventClick: function(event) {
           $.ajax({
              url: "events/" + event.id
            });
        }
	});
});
