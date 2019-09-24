class TimingFramework
  MIN_ARRAY_SIZE = 5000
  MAX_ARRAY_SIZE = 100000
  INTERVAL = 5000
  METHODS = [:last, :reverse, :shuffle, :sort]
  WARM_UP = 3
  REPEAT = 20

  def run
    i = MIN_ARRAY_SIZE
    while i <= MAX_ARRAY_SIZE do
      call_each_method(create_numbers_array(i))
      i += INTERVAL
    end
  end

  private

  def create_numbers_array(max)
    [*1..max].shuffle
  end

  def call_each_method(array)
    METHODS.each do |method|
      result = []
      WARM_UP.times { time_method { array.send(method) } }
      REPEAT.times { result << time_method { array.send(method) } }
      save_to_file(method, array.length, result)
    end
  end

  def time_method(&block)
    t0 = Time.now
    block.call
    t1 = Time.now
    ((t1 - t0) * 1000.0).round(3)
  end

  def save_to_file(method, length, durations)
    file = File.open("#{method}.txt", 'a')
    file.puts("#{length}, #{durations.join(', ')}")
    file.close
  end
end
