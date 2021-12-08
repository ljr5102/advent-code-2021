def depth_increases(values)
  count = 0
  1.upto(values.length - 1) do |idx|
    count += 1 if values[idx] > values[idx - 1]
  end
  count
end

def window_depth_increases(values)
  window_sums = values.each_with_index.inject([]) do |acc, (el, idx)|
    if idx + 2 < values.length
      acc << el + values[idx + 1] + values[idx + 2]
    end
    acc
  end
  depth_increases(window_sums)
end

if __FILE__ == $0
  input = File.readlines("inputs/day_1/input.txt").map(&:to_i)
  puts "Number of depth increases is #{depth_increases(input)}"
  puts "Number of window depth increases is #{window_depth_increases(input)}"
end
