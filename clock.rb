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
	  r = time / 5
	  puts "R" * (r) + "O" * (4 - r)
	end
end