class Clock
  attr_accessor :hours_minutes_seconds
  
	def initialize(time_string)
	  self.hours_minutes_seconds = time_string.split(":")
	  puts seconds
	end
	
	private
	def seconds
	  (self.hours_minutes_seconds[2].to_i % 2 == 0) ? "Y" : "O"
	end
end