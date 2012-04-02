class Clock
  
  RED    = "R"
  YELLOW = "Y"
  OFF    = "O"
  
  def lamps(time_string)
    hours_minutes_seconds = time_string.split(":")
    print_seconds(hours_minutes_seconds[2].to_i)
    print_hours(hours_minutes_seconds[0].to_i)
    print_minutes(hours_minutes_seconds[1].to_i)
  end
  
  def print_seconds(time)
    puts (time % 2 == 0) ? YELLOW : OFF
  end
  
  def print_hours(time)
    print_four_lamps(time / 5, RED)
    print_four_lamps(time % 5, RED)
  end
  
  def print_minutes(time)
    print_eleven_lamps(time / 5)
    print_four_lamps(time % 5, YELLOW)
  end

  def print_four_lamps(num_lit, color)
    puts on_lamps(num_lit, color) + off_lamps(4 - num_lit)
  end
  
  def print_eleven_lamps(num_lit)
    lit_lamps = 1.upto(num_lit).map { |lamp| (lamp % 3 == 0) ? RED : YELLOW }.join('')
    puts lit_lamps + off_lamps(11 - lit_lamps.length)
  end
  
  def on_lamps(num, color)
    color * num
  end
  
  def off_lamps(num)
    OFF * num
  end
end