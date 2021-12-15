def multiple_overlapping_horizontal_vertical(points)
  plot_points = Hash.new(0)
  points.each do |(first, last)|
    x1, y1 = first
    x2, y2 = last
    next if x1 != x2 && y1 != y2

    if x1 == x2
      y1_min = y1 < y2
      if y1_min
        until y1 > y2
          plot_points["x:#{x1} - y:#{y1}"] += 1
          y1 += 1
        end
      else
        until y2 > y1
          plot_points["x:#{x2} - y:#{y2}"] += 1
          y2 += 1
        end
      end
    else
      x1_min = x1 < x2
      if x1_min
        until x1 > x2
          plot_points["x:#{x1} - y:#{y1}"] += 1
          x1 += 1
        end
      else
        until x2 > x1
          plot_points["x:#{x2} - y:#{y2}"] += 1
          x2 += 1
        end
      end
    end
  end
  plot_points.values.count { |x| x > 1 }
end

def multiple_overlapping_total(points)
  plot_points = Hash.new(0)
  points.each do |(first, last)|
    x1, y1 = first
    x2, y2 = last

    if x1 == x2
      y1_min = y1 < y2
      if y1_min
        until y1 > y2
          plot_points["x:#{x1} - y:#{y1}"] += 1
          y1 += 1
        end
      else
        until y2 > y1
          plot_points["x:#{x2} - y:#{y2}"] += 1
          y2 += 1
        end
      end
    elsif y1 == y2
      x1_min = x1 < x2
      if x1_min
        until x1 > x2
          plot_points["x:#{x1} - y:#{y1}"] += 1
          x1 += 1
        end
      else
        until x2 > x1
          plot_points["x:#{x2} - y:#{y2}"] += 1
          x2 += 1
        end
      end
    else
      x_modifier = x1 > x2 ? -1 : 1
      y_modifier = y1 > y2 ? -1 : 1
      if x_modifier == 1
        until x1 > x2
          plot_points["x:#{x1} - y:#{y1}"] += 1
          x1 += x_modifier
          y1 += y_modifier
        end
      else
        until x1 < x2
          plot_points["x:#{x1} - y:#{y1}"] += 1
          x1 += x_modifier
          y1 += y_modifier
        end
      end
    end
  end
  plot_points.values.count { |x| x > 1 }
end

if __FILE__ == $PROGRAM_NAME
  input = File.readlines("inputs/day_5/input.txt").map { |el| el.strip.split("->").map { |el2| el2.strip.split(",").map(&:to_i) } }
  puts "Number of points with multiple vert/horiz intersections is #{multiple_overlapping_horizontal_vertical(input)}"
  puts "Number of points with multiple total intersections is #{multiple_overlapping_total(input)}"
end
