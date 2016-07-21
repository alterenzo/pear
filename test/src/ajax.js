$( document ).ready(function() {

  function getCard(userId) {
    $.getJSON( "/profiles/" + userId, function(data) {
      $( "#profile_about_me" ).html( data.about_me )
      $( "#profile_image" ).attr( "src", "https://avatars2.githubusercontent.com/u/" + data.uid + "?v=3&s=300" )
      $( "#profile_name" ).html( data.name )
      $( "#profile_user_name" ).html( "@" + data.username )
      $( "#profile_current_project" ).html( data.current_project )
    });
  }

  function makeDecision(buttonId) {
    $.post( "<%= decisions_path %>", { decision: buttonId }, function(data) {
      getCard(data.id)
    });
  }

  $( "#left" ).click(function() {
    makeDecision(this.id);
  });

  $( "#right" ).click(function() {
    makeDecision(this.id);
  });

  // ================ Single Swipe ===============

  $("#card").swipe({
    swipeLeft: function(event, direction, distance, duration, fingerCount) {
      makeDecision(direction);
    },

    swipeRight: function(event, direction, distance, duration, fingerCount) {
      makeDecision(direction);
    }
  });

});
