def create_numbers_array(max)
  return *(1..max)
end

arr = create_numbers_array(20000)
proc = lambda { arr.shuffle }

def timer(proc)
  t0 = Time.now
  proc.call
  t1 = Time.now
  interval = ((t1 - t0) * 1000.0).round(3)
  p interval
end

timer(proc)
