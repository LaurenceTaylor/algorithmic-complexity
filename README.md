# Algorithmic Complexity (Work In Progress)

## Timing Framework

This is some code which times how long array methods take to run on inputs of varying sizes.

### How to Use

- Ensure you have [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [Bundler](https://bundler.io/) installed.
- Clone this repository.
- In the command line: run `bundle` in the command line to install dependencies.
- From the root directory, run `irb -r ./timing_framework.rb`.
- Create a new TimingFramework object with `TimingFramework.new`. This takes an array of methods you would like to time (as symbols), for example `TimingFramework.new([:reverse, :sort])`. If left blank, the default argument is `[:last, :reverse, :shuffle, :sort]`.
- Call `#run` on your TimingFramework object to produce .txt files with timing data for each of the methods. Currently, each method is called on inputs ranging between 5000-100000 (intervals of 5000). Each method is repeated on each input size 100 times, so you can take the average later on. These files are ready to be imported into a spreadsheet.
