class Frame
	def initialize(frame_number, *rolls)
		@frame_number = frame_number
		@rolls = rolls
		@is_spare = is_spare?(rolls)
	end
end