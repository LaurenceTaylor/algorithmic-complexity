# Algorithmic Complexity (Work In Progress)

## Timing Framework

This is some code which times how long array methods take to run on inputs of varying sizes.

### How to Use

1. Ensure you have [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [Bundler](https://bundler.io/) installed.
2. Clone this repository.
3. In the command line: run `bundle` in the command line to install dependencies.
4. From the root directory, run `irb -r ./timing_framework.rb`.
5. Create a new TimingFramework object with `TimingFramework.new`. This takes an array of methods you would like to time (as symbols), for example `TimingFramework.new(method_list: [:reverse, :sort])`. If left blank, the default argument is `[:last, :reverse, :shuffle, :sort]`.
6. Call `#run` on your TimingFramework object to produce .txt files with timing data for each of the methods. These files are ready to be imported into a spreadsheet. Currently, each method is called on inputs ranging between 5000-100000 (intervals of 5000). The methods are repeated on each input size 100 times.

Code example:

```
irb -r ./timing_framework.rb
2.6.3 :001 > timing_framework = TimingFramework.new(method_list: [:sort])
=> #<TimingFramework:0x00007fa71d1f2d38 @method_list=[:sort], @file_writer=#<FileWriter:0x00007fa71d1f2ce8>>
2.6.3 :002 > timing_framework.run
 => nil
```
