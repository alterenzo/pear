describe("Cards", function() {
  var cards, request, user, profile;

  user = {
    tags: {
      0: "javascript",
      1: "rails",
      2: "ruby"
    },
    user: {
      about_me: "I LOVE HORSES",
      github_repo: "http://findapear.com"
    }
  };

  profile = {
    id: 1
  }

  beforeEach(function() {
    jasmine.Ajax.install();

    onSuccess = jasmine.createSpy('onSuccess');
    onFailure = jasmine.createSpy('onFailure');

    cards = new Cards();
  });

  afterEach(function() {
    jasmine.Ajax.uninstall();
  });

  it("makes a GET request to profile_path", function() {
    cards.getCardData(1, onSuccess, {
      onSuccess: onSuccess,
      onFailure: onFailure
    });

    request = jasmine.Ajax.requests.mostRecent();
    expect(request.url).toBe('/profiles/1');
    expect(request.method).toBe('GET');
    expect(onSuccess).not.toHaveBeenCalled();

    jasmine.Ajax.requests.mostRecent().respondWith({
      "status": 200,
      "contentType": "application/json",
      "responseText": JSON.stringify(user)
    });

    expect(onSuccess).toHaveBeenCalledWith(user);
  });

  it("makes a POST request to decisions_path", function() {
    cards.makeDecision('left', onSuccess, {
      onSuccess: onSuccess,
      onFailure: onFailure
    });

    request = jasmine.Ajax.requests.mostRecent();
    expect(request.url).toBe('/decisions');
    expect(request.method).toBe('POST');
    expect(request.data()).toEqual({decision: ['left']});

    jasmine.Ajax.requests.mostRecent().respondWith({
      "status": 200,
      "contentType": "application/json",
      "responseText": JSON.stringify(profile)
    });

    expect(onSuccess).toHaveBeenCalledWith(profile);
  });

});
