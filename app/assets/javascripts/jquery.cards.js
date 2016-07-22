'use strict'

function Cards(firstCard) {
  this._currentCard = firstCard;
  this._nextCard = firstCard;
}

Cards.prototype.getCardData = function(callback) {
  //console.log(this._nextCard)
  $.getJSON("/profiles/" + this._nextCard, function(data) {
    $( "#profile_about_me" ).html( data.user.about_me )
    $( "#profile_image" ).attr( "src", "https://avatars2.githubusercontent.com/u/" + data.user.uid + "?v=3&s=300" )
    $( "#profile_name" ).html( data.user.name )
    $( "#profile_user_name" ).html( "@" + data.user.username )
    $( "#profile_current_project" ).html( data.user.current_project )
    // $( "#profile_skills" ).html( data.tags.join(" "))
    if (callback) callback(data);
  });
},

Cards.prototype.makeDecision = function(buttonId, callback) {
  console.log(this._currentCard)
  $.post("/decisions", { decision: buttonId, on: this._currentCard }, (function(data) {
    this._nextCard = data.id
    this.getCardData()
    if (callback) callback(data);
  }).bind(this));
};
