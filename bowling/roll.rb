class Roll
	attr_accessor :roll_count, :pins_knocked_down

	def initalize(roll_count, pins_knocked_down)
		@roll_count = roll_count
		@pins_knocked_down = pins_knocked_down
		@is_strike = is_strike?(pins_knocked_down)
	end
end