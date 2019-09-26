require './file_writer'

class TimingFramework
  MIN_ARRAY_SIZE = 5000
  MAX_ARRAY_SIZE = 100_000
  INTERVAL = 5000
  DEFAULT_METHODS = [:last, :reverse, :shuffle, :sort]
  WARM_UP = 10
  REPEAT = 100

  def initialize(methods = DEFAULT_METHODS, file_writer = FileWriter.new)
    @methods = methods
    @file_writer = file_writer
  end

  def run
    @current_array_size = MIN_ARRAY_SIZE
    while @current_array_size <= MAX_ARRAY_SIZE
      time_each_method(create_randomised_array(@current_array_size))
      @current_array_size += INTERVAL
    end
  end

  private

  def create_randomised_array(size)
    [*1..size].shuffle
  end

  def time_each_method(array)
    @methods.each do |method|
      entry = create_entry_string(time_method_repeater(method, array))
      save_to_file(method, entry)
    end
  end

  def time_method_repeater(method, array)
    durations = []
    WARM_UP.times { time_method { array.send(method) } }
    REPEAT.times { durations << time_method { array.send(method) } }
    durations
  end

  def time_method(&block)
    t0 = Time.now
    block.call
    t1 = Time.now
    ((t1 - t0) * 1000.0).round(3)
  end

  def create_entry_string(durations)
    "#{@current_array_size}, #{durations.join(', ')}"
  end

  def save_to_file(method, entry)
    @file_writer.save(filename: method, entry: entry)
  end
end
