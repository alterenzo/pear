'use strict'

$(document).ready(function(){

  getCardData(1);

  function getCardData(userId) {
    $.getJSON("/profiles/" + userId, function(data) {
      $( "#profile_about_me" ).html( data.user.about_me )
      $( "#profile_image" ).attr( "src", "https://avatars2.githubusercontent.com/u/" + data.user.uid + "?v=3&s=300" )
      $( "#profile_name" ).html( data.user.name )
      $( "#profile_user_name" ).html( "@" + data.user.username )
      $( "#profile_current_project" ).html( data.user.current_project )
      $( "#profile_skills" ).html( data.tags.join(" "))
    });
  };

  function makeDecision(buttonId) {
    $.post("/decisions", { decision: buttonId }, function(data) {
      getCardData(data.id)
    });
  };

  $( "#left" ).click(function() {
    makeDecision(this.id);
  });

  $( "#right" ).click(function() {
    makeDecision(this.id);
  });

  $("#card").swipe({
    swipeLeft: function(event, direction, distance, duration, fingerCount) {
      makeDecision(direction);
    },

    swipeRight: function(event, direction, distance, duration, fingerCount) {
      makeDecision(direction);
    }
  });

});
