'use strict'

function Cards() {

}

Cards.prototype.getCardData = function(userId, callback) {
  $.getJSON("/profiles/" + userId, function(data) {
    console.log(data)
    $( "#profile_about_me" ).html( data.user.about_me )
    $( "#profile_image" ).attr( "src", "https://avatars2.githubusercontent.com/u/" + data.user.uid + "?v=3&s=300" )
    $( "#profile_name" ).html( data.user.name )
    $( "#profile_user_name" ).html( "@" + data.user.username )
    $( "#profile_current_project" ).html( data.user.current_project )
    // $( "#profile_skills" ).html( data.tags.join(" "))
    callback(data);
  });
},

Cards.prototype.makeDecision = function(buttonId, callback) {
  $.post("/decisions", { decision: buttonId }, (function(data) {
    this.getCardData(data.id)
    callback(data);
  }).bind(this));
};

$(document).ready(function(){
  var cards = new Cards();
  cards.getCardData(1);

  $( "#left" ).click(function() {
    cards.makeDecision(this.id);
  });

  $( "#right" ).click(function() {
    cards.makeDecision(this.id);
  });

  $("#card").swipe({
    swipeLeft: function(event, direction, distance, duration, fingerCount) {
      cards.makeDecision(direction);
    },

    swipeRight: function(event, direction, distance, duration, fingerCount) {
      cards.makeDecision(direction);
    }
  });

});
