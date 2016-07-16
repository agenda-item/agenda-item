$(document).ready(function() {
  // start of code for adding hover over pop up navbar

   $(function() {
     $('#ai-new-agenda-item li ul').hide().removeClass('drop');
       $('#ai-new-agenda-item li').hover(function () {
         $('ul', this).stop().slideDown(100);
   },
   function () {
     $('ul', this).stop().slideUp(100);
   }
  );
   });

  // end of code for adding hover over pop up navbar

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
