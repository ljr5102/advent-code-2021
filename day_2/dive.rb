POSITION_DIRECTION_MAP = {
  "forward" => :horizontal,
  "up" => :depth,
  "down" => :depth,
}

DIRECTION_MODIFIER = {
  "forward" => 1,
  "up" => -1,
  "down" => 1,
}

def final_position(directions)
  position = { depth: 0, horizontal: 0 }
  directions.each do |(direction, val)|
    key = POSITION_DIRECTION_MAP[direction]
    value = val * DIRECTION_MODIFIER[direction]
    position[key] += value
  end
  position
end

def final_position_v2(directions)
  aim = 0
  position = { depth: 0, horizontal: 0 }
  directions.each do |(direction, val)|
    value = val * DIRECTION_MODIFIER[direction]
    if direction == "forward"
      position[:horizontal] += value
      position[:depth] += aim * value
    else
      aim += value
    end
  end
  position
end

if __FILE__ == $0
  input = File.readlines("inputs/day_2/input.txt").map do |vals|
    dir, val = vals.strip.split("\s")
    [dir, val.to_i]
  end

  final = final_position(input)
  puts "Version 1"
  puts "Final Position is a depth of #{final[:depth]} and horizontal of #{final[:horizontal]}"
  puts "Multiplied value is #{final[:depth] * final[:horizontal]}"
  puts "-----"
  final = final_position_v2(input)
  puts "Version 2"
  puts "Final Position is a depth of #{final[:depth]} and horizontal of #{final[:horizontal]}"
  puts "Multiplied value is #{final[:depth] * final[:horizontal]}"
end
