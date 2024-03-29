# Robot Hoover Navigator

A program that navigates an imaginary robotic hoover (much like a [Roomba](https://en.wikipedia.org/wiki/Roomba)) through an equally imaginary room based on:

● Room dimensions as X and Y coordinates, identifying the top right corner of the room rectangle. This room is divided up in a grid based on these dimensions; a room that has dimensions X: 5 and Y: 5 has 5 columns and 5 rows, so 25 possible hoover positions. The bottom left corner is the point of origin for our coordinate system, so as the room contains all coordinates its bottom left corner is defined by X: 0 and Y: 0.

● Locations of patches of dirt, also defined by X and Y coordinates identifying the bottom left corner of those grid positions.

● An initial hoover position (X and Y coordinates like patches of dirt)

● Driving instructions (as cardinal directions) where e.g. N and E mean "go north" and "go east" respectively).

The room will be rectangular, has no obstacles (except the room walls), no doors and all locations in the room will be clean (hoovering has no effect) except for the locations of the patches of dirt presented in the program input.

Placing the hoover on a patch of dirt ("hoovering") removes the patch of dirt so that patch is then clean for the remainder of the program run. The hoover is always on - there is no need to enable it. Driving into a wall has no effect (the robot skids in place).

### Goal

The goal of the program is to take the room dimensions, the locations of the dirt patches, the hoover location and the driving instructions as input and to then output the following:

● The final hoover position (X, Y)

● The number of patches of dirt the robot cleaned up

## Input

Program input is received in a file with the format described here. The file is named `input.txt` and resides in the same directory as the [executable program/web page].

Example:
```
5 5
1 2
1 0
2 2
2 3
NNESEESWNWW
```
● the first line holds the room dimensions (X Y), separated by a single space (all coordinates will be presented in this format)

● the second line holds the hoover position

● subsequent lines contain the zero or more positions of patches of dirt (one per line)

● the next line then always contains the driving instructions (at least one)

### Outputs

The program output is printed to the standard output (STDOUT) of the terminal.

● The first line of the program output displays the X and Y coordinates marking the position of the hoover after processing all commands.

● The second line of the program output displays the number of patches of dirt the robot cleaned up.

Example (matching the input above):
```
1 3
1
```

The program also outputs a text file (in robot-navigator-ruby/lib) so it can be automatically checked.


# How to download and run the program

### To download:
```
git clone git@github.com:eashworth/Robot-Navigator-Ruby.git
```
### To run:

```
$cd robot-navigator-ruby/lib
$ruby navigator.rb
```

### Testing:

I attempted to TDD the program, but in the time available I was not able to write a successful test for reading the input file. As this was the first step, I eventually made a pragmatic decision to write the program without TDD, and this took all of the time I had available. If I had had more time, I would have gone back to researching suitable tests, with the aim of testing as much of the program as possible, and refactoring further.

### Other languages:

Before beginning this repo, I attempted to write the program using Node.js - an attempt that unfortunately took up most of the time available. I installed Mocha and Chai, but despite getting the test framework up and running (with some sample tests running on a sample program) I was unable to write tests that would enable me to TDD the program in Node.js. I wrote a function to read from the input file, but in the absence of tests, decided that it would be a better idea to write the program in Ruby (which which I am more familiar). I have uploaded the Node.js attempt in case it is of interest: https://github.com/eashworth/Robot-Hoover-Navigator
