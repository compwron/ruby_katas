class Game
	def initialize
		@frames = []
	end

	FRAMES_IN_GAME = 10
	LAST_FRAME = FRAMES_IN_GAME - 1
	ROLL1_PINS = 0
	ROLL2_PINS = 1
	ROLL3_PINS = 2

	def frame(roll1_pins, roll2_pins, third_roll_pins=0)
		@frames << [roll1_pins, roll2_pins, third_roll_pins]
		nil
	end

	def score(frame_to_score)
		score = 0
		0.upto(frame_to_score - 1).each {|f|
			roll1_score = @frames[f][ROLL1_PINS]
			roll2_score = @frames[f][ROLL2_PINS]
			roll3_score = @frames[f][ROLL3_PINS]
			next_frame = f + 1
			if f < LAST_FRAME
				next_frame_roll1 = @frames[next_frame][ROLL1_PINS]
				next_frame_roll2 = @frames[next_frame][ROLL2_PINS]
			end

			score += roll1_score + roll2_score
			if roll1_score == 10 # strike
				score += next_frame_roll1 + next_frame_roll2
			elsif roll1_score + roll2_score == 10 # spare
				if f == LAST_FRAME
					score += roll3_score
				elsif next_frame_roll1 != 0
					score += next_frame_roll1
				else
					score += next_frame_roll2
				end
			end
		}
		score
	end
end
