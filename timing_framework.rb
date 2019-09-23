class TimingFramework
  MIN_ARRAY_SIZE = 5000
  MAX_ARRAY_SIZE = 100000
  INTERVAL = 5000
  METHODS = [:last, :reverse, :shuffle, :sort]

  def run
    i = MIN_ARRAY_SIZE
    while i <= MAX_ARRAY_SIZE do
      p "arr.length = #{i}"
      call_each_method(create_numbers_array(i))
      p '---'
      i += INTERVAL
    end
  end

  private

  def create_numbers_array(max)
    [*1..max].shuffle
  end

  def call_each_method(array)
    METHODS.each do |method|
      p method
      p time_method { array.send(method) }
    end
  end

  def time_method(&block)
    t0 = Time.now
    block.call
    t1 = Time.now
    ((t1 - t0) * 1000.0).round(3)
  end
end
