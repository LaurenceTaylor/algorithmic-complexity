require './file_writer'

class TimingFramework
  MIN_INPUT_SIZE = 5000
  MAX_INPUT_SIZE = 100_000
  INPUT_SIZE_INTERVAL = 5000
  DEFAULT_METHODS = [:last, :reverse, :shuffle, :sort]
  WARM_UP = 20
  REPEAT = 100

  def initialize(method_list: DEFAULT_METHODS, file_writer: FileWriter.new)
    @method_list = method_list
    @file_writer = file_writer
  end

  def run
    @current_input_size = MIN_INPUT_SIZE
    while @current_input_size <= MAX_INPUT_SIZE
      randomised_array = create_randomised_array(@current_input_size)
      run_methods_on(randomised_array)
      @current_input_size += INPUT_SIZE_INTERVAL
    end
  end

  private

  def create_randomised_array(size)
    [*1..size].shuffle
  end

  def run_methods_on(input)
    @method_list.each do |method|
      method_timings = produce_method_timings(method, input)
      entry = create_entry_string(method_timings)
      write_to_file(method, entry)
    end
  end

  def produce_method_timings(method, input)
    method_timings = []
    WARM_UP.times { time_method { input.send(method) } }
    REPEAT.times { method_timings << time_method { input.send(method) } }
    method_timings
  end

  def time_method(&block)
    t0 = Time.now
    block.call
    t1 = Time.now
    ((t1 - t0) * 1000.0).round(3)
  end

  def create_entry_string(method_timings)
    "#{@current_input_size}, #{method_timings.join(', ')}"
  end

  def write_to_file(method, entry)
    @file_writer.save(filename: method, entry: entry)
  end
end
