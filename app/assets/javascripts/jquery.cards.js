'use strict'

function Cards(firstCard) {
  this._currentCard = firstCard;
  this._nextCard = firstCard;
}

Cards.prototype.getCardData = function(callback) {
  $.getJSON("/profiles/" + this._nextCard, function(data) {
    var tags = "";

    $( "#profile_about_me" ).html( data.user.about_me )
    $( "#profile_image" ).attr( "src", "https://avatars2.githubusercontent.com/u/" + data.user.uid + "?v=3&s=300" )
    $( "#profile_name" ).html( data.user.name )
    $( "#profile_user_name" ).html( "@" + data.user.username )
    $( "#profile_current_project" ).html( data.user.current_project )

    $.each( data.tags, function( key, value ) {
      tags += " " + value
    });

    $( "#profile_skills" ).html(tags)

    if (callback) callback(data);
  });
},

Cards.prototype.makeDecision = function(buttonId, callback) {
  $.post("/decisions", { decision: buttonId, on: this._currentCard }, (function(data) {
    this._nextCard = data.id
    this.getCardData()
    if (callback) callback(data);
  }).bind(this));
};
