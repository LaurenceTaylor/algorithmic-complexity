# Algorithmic Complexity

## Timing Framework

This is some code which times how long array methods take to run on inputs of varying sizes.

### How to Use

1. Ensure you have [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [Bundler](https://bundler.io/) installed.
2. Clone this repository.
3. In the command line: run `bundle` to install dependencies.
4. From the root directory, run `irb -r ./timing_framework.rb` to enter Ruby's REPL.
5. Create a new TimingFramework object with `TimingFramework.new`.
6. Call the `#run` method on your object. This takes a `method_list` keyword argument: an array of the methods you would like to time, as symbols. For example, `timing_framework.run(method_list: [:reverse, :sort])`. If no arguments are given, the default methods are `[:last, :reverse, :shuffle, :sort]`.
7. Require files from the /lib folder to test methods I have written, e.g. `require './lib/most_frequent.rb'`. These methods are monkey-patched onto the Array class.
8. The `#run` method will produce .txt files with timing data for each method.
   These files are ready to be imported into a spreadsheet. Currently, each method is called on inputs ranging between 5000-100000 (intervals of 5000). The methods are repeated on each input size 100 times to improve data quality.

Code example:

```
irb -r ./timing_framework.rb
2.6.3 :001 > timing_framework = TimingFramework.new
=> #<TimingFramework:0x00007fa71d1f2d38 @method_list=[:sort], @file_writer=#<FileWriter:0x00007fa71d1f2ce8>>
2.6.3 :002 > timing_framework.run(method_list: [:sort])
 => nil
```
