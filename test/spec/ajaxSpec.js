'use strict';

describe('Airport', function(){

  var airport;
  var plane;

  beforeEach(function(){
    airport = new Airport();
    plane = jasmine.createSpy('plane');
  });

  it('initializes with an empty array for storing planes', function(){
    expect(airport.planes()).toEqual([]);
  });

  it('clears planes for landing and stores that plane', function(){
    spyOn(airport, 'isStormy').and.returnValue(false);
    airport.clearForLanding(plane);
    expect(airport.planes()).toContain(plane);
  });

  it('clears a plane for takeoff and removes plane from hangar', function(){
    spyOn(airport, 'isStormy').and.returnValue(false);
    airport.clearForLanding(plane);
    airport.clearForTakeoff(plane);
    expect(airport.planes()).not.toContain(plane);
  });

  it('can have stormy weather', function(){
    spyOn(Math, 'random').and.returnValue(1);
    expect(airport.isStormy()).toBeTruthy();
  });

  it('can have normal weather', function(){
    spyOn(Math, 'random').and.returnValue(0);
    expect(airport.isStormy()).toBeFalsy();
  });

  it('doesn\'t clear a plane for takeoff in stormy weather', function(){
    spyOn(airport, 'isStormy').and.returnValue(true);
    expect(function(){airport.clearForTakeoff(plane)}).toThrowError('Plane can\'t takeoff in stormy weather');
  });

  it('doesn\'t clear a plane for landing in stormy weather', function(){
    spyOn(airport, 'isStormy').and.returnValue(true);
    expect(function(){airport.clearForLanding(plane)}).toThrowError('Plane can\'t land in stormy weather');
  });

});
