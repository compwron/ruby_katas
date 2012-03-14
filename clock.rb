class Clock
	def initialize(time_string)
	  hours_minutes_seconds = time_string.split(":")
	  print_seconds(hours_minutes_seconds[2].to_i)
	  print_hours(hours_minutes_seconds[0].to_i)
	end
	
	private
	def print_seconds(time)
	  puts (time % 2 == 0) ? "Y" : "O"
	end
	
	def print_hours(time)
	  print_lamps(time / 5)
	  print_lamps(time % 5)
	end

	def print_lamps(lamps_on)
		puts "R" * lamps_on + "O" * (4 - lamps_on)
	end
end