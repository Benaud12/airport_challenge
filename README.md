Airport Challenge
=======================

## Synopsis

Write software to control the flow of planes at an airport. The planes can land and take off in good weather. Occasionally it may be stormy, in which case no planes can land or take off. Here are some example user stories highlighting the requirements.

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing or taking off when the weather is stormy
```

The task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. The weather will generally be ok but on occasion it will be stormy.

## To run this version

This is designed to run in the command line.

- Fork this repository and clone it to your local machine
- Run `gem install bundle` in the command line
- Once complete, run `bundle` to install the relevant gems
- You may then create airports and planes to your heart's content, as per the example below...

```
$ irb
2.2.1 :001 > airport = Airport.new
 => #<Airport:0x007fc26213a818 @capacity=10, @hangar=[]>
2.2.1 :002 > plane = Plane.new
 => #<Plane:0x007fc2621308e0 @flying=true>
2.2.1 :003 > airport.receive plane
 => [#<Plane:0x007fc2621308e0 @flying=false>]
2.2.1 :004 > airport.release plane
 => #<Plane:0x007fc2621308e0 @flying=true>
2.2.1 :005 >
```

## Technologies Used

- Ruby
- RSpec

## Job List

- Using Ruby and testing in RSpec, test drive the creation of a set of classes/modules to satisfy the above user stories
- Implementing the [SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) principles of object-oriented design


## Favourite Code Snippet

Quite a neat method for selecting and releasing a specific plane...

~~~
while hangar.last != plane
  hangar.rotate!
end
hangar.last.take_off
hangar.pop
~~~


## Takeaway

A useful challenge that gives you chance to play with, and helps to understand, some of the basic principles of Object Oriented Design, including single responsibility and dependaency inversion.

Also good for introducing Test Driven Development.
