def gamma_rate(report)
  len = report.first.length
  map = build_count_map(report)
  gamma_binary = ""
  len.times do |idx|
    val, _count = map[idx].max_by { |_k, v| v }
    gamma_binary << val.to_s
  end
  to_decimal(gamma_binary)
end

def epsilon_rate(report)
  len = report.first.length
  map = build_count_map(report)
  epsilon_binary = ""
  len.times do |idx|
    val, _count = map[idx].min_by { |_k, v| v }
    epsilon_binary << val.to_s
  end
  to_decimal(epsilon_binary)
end

def oxygen_generator_rating(report, idx = 0)
  if report.length.zero?
    raise "Filtered out too many!"
  elsif report.length == 1
    to_decimal(report.first)
  elsif idx >= report.first.length
    raise "You've continued past the length of the report numbers!"
  else
    map = build_count_map(report)
    if map[idx][0] == map[idx][1]
      val = 1
    else
      val, _count = map[idx].max_by { |_k, v| v }
    end
    filtered = report.select { |el| el[idx].to_i == val }
    oxygen_generator_rating(filtered, idx + 1)
  end
end

def co2_scrubber_rating(report, idx = 0)
  if report.length.zero?
    raise "Filtered out too many!"
  elsif report.length == 1
    to_decimal(report.first)
  elsif idx >= report.first.length
    raise "You've continued past the length of the report numbers!"
  else
    map = build_count_map(report)
    if map[idx][0] == map[idx][1]
      val = 0
    else
      val, _count = map[idx].min_by { |_k, v| v }
    end
    filtered = report.select { |el| el[idx].to_i == val }
    co2_scrubber_rating(filtered, idx + 1)
  end
end

def build_count_map(report)
  initial_map = {}
  report.first.length.times do |idx|
    initial_map[idx] = { 0 => 0, 1 => 0 }
  end
  report.inject(initial_map) do |acc, el|
    el.length.times do |idx|
      acc[idx][el[idx].to_i] += 1
    end
    acc
  end
end

def to_decimal(binary)
  val = 0
  binary.each_char.with_index do |char, idx|
    power = (binary.length - 1) - idx
    val += char.to_i * 2**power
  end
  val
end

if __FILE__ == $PROGRAM_NAME
  input = File.readlines("inputs/day_3/input.txt").map(&:strip)
  gamma = gamma_rate(input)
  epsilon = epsilon_rate(input)
  oxygen = oxygen_generator_rating(input)
  co2 = co2_scrubber_rating(input)

  puts "Gamma: #{gamma}"
  puts "Epsilon: #{epsilon}"
  puts "Power Consumption: #{gamma * epsilon}"
  puts "----"
  puts "Oxygen: #{oxygen}"
  puts "CO2: #{co2}"
  puts "Life Support Rating: #{oxygen * co2}"
end
