$(document).ready(function(){
  
/*
$( "body" ).mousemove( function( event ) {
          var msg = "Handler for .mousemove() called at ";
          msg += event.pageX + ", " + event.pageY;
          $( "#log" ).append( "<div>" + msg + "</div>" );
        }); */
        
// SCROLLING DISTANCE
 var mrefreshinterval = 500;  //update display every 500ms
 var lastmousetime;
 
 var lastscroll=-1; 
 var scrolltravel = 0;


$(window).scroll( function() {
          var scrollPosition = $(document).scrollTop();
          $( "#scrollMove" ).attr('position', scrollPosition);
          if (lastscroll>-1)
           scrolltravel += Math.max(Math.abs(scrollPosition-lastscroll));
          lastscroll=scrollPosition;
           $( "#scrollMove" ).attr('cumDistance', scrolltravel);
        });

// https://gist.github.com/ripper234/5757309 snippet 
        
 //var mrefreshinterval = 500; // update display every 500ms
 var lastmousex=-1; 
 var lastmousey=-1;
// var lastmousetime;
 var mousetravel = 0;
 $('body').mousemove(function(e) {
     var mousex = e.pageX;
     var mousey = e.pageY;
     if (lastmousex > -1)
         mousetravel += Math.max( Math.abs(mousex-lastmousex), Math.abs(mousey-lastmousey) );
     lastmousex = mousex;
     lastmousey = mousey;
     $( "#mouseMove" ).attr('cumDistance', mousetravel);
     $( "#mouseMove" ).attr('coorX', mousex);
     $( "#mouseMove" ).attr('coorY', mousey);
     //QUERY TO WRITE TO SERVER
     
 });
        


//STOPWATCH

setInterval(updateDisplay, 1); // every millisecond call updateDisplay

function updateDisplay() {
    var value = parseInt($('#timer').attr('elapsed'), 10);
    value++;
    $('#timer').attr('elapsed', value);

}


/* SUBMIT button id='ui2-submit'
var clickCount= 0;
function submitClick() {
  clickCount ++;
  $('#clicCount').attr('count', clickCount);
  
} */

        
        });