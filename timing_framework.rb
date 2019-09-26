require './file_writer'

class TimingFramework
  MIN_ARRAY_SIZE = 5000
  MAX_ARRAY_SIZE = 100_000
  INTERVAL = 5000
  METHODS = [:last, :reverse, :shuffle, :sort]
  WARM_UP_ROUND_COUNT = 10
  REPEAT_METHOD_COUNT = 100

  def initialize(file_writer = FileWriter.new)
    @file_writer = file_writer
  end

  def run
    @current_array_size = MIN_ARRAY_SIZE
    while @current_array_size <= MAX_ARRAY_SIZE
      randomised_array = create_randomised_array(@current_array_size)
      time_each_method_on(randomised_array)
      @current_array_size += INTERVAL
    end
  end

  private

  def create_randomised_array(max)
    [*1..max].shuffle
  end

  def time_each_method_on(array)
    METHODS.each do |method|
      durations = []
      WARM_UP_ROUND_COUNT.times { time_method { array.send(method) } }
      REPEAT_METHOD_COUNT.times { durations << time_method { array.send(method) } }
      entry = create_entry_string(durations)
      save_to_file(method, entry)
    end
  end

  def time_method(&block)
    t0 = Time.now
    block.call
    t1 = Time.now
    ((t1 - t0) * 1000.0).round(3)
  end

  def save_to_file(method, durations)
    file = File.open("#{method}.txt", 'a')
    file.puts("#{@current_array_size}, #{durations.join(', ')}")
    file.close
  end

  def create_entry_string(durations)
    "#{@current_array_size}, #{durations.join(', ')}"
  end

  def save_to_file(method, entry)
    @file_writer.save(filename: method, entry: entry)
  end
end
