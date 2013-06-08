class Game
  
  attr_accessor :frames

  def initialize(*frames)
    @frames = frames
  end

  # FRAMES_IN_GAME = 10
  # LAST_FRAME = FRAMES_IN_GAME - 1
  # ROLL1 = 0
  # ROLL2 = 1
  # ROLL3 = 2

  # def frame(roll1, roll2, roll3=0)
  #   @frames << [roll1, roll2, roll3]
  #   nil
  # end

  # def score(frame)
  #   score = 0
  #   0.upto(frame - 1).each {|f|
  #     roll1, roll2, roll3 = @frames[f][ROLL1], @frames[f][ROLL2], @frames[f][ROLL3]
  #     next_frame = f + 1
  #     if f < LAST_FRAME
  #       next_frame_roll1 = @frames[next_frame][ROLL1]
  #       next_frame_roll2 = @frames[next_frame][ROLL2]
  #     end

  #     score += roll1 + roll2
  #     if roll1 == 10 # strike
  #       score += next_frame_roll1 + next_frame_roll2
  #     elsif roll1 + roll2 == 10 # spare
  #       if f == LAST_FRAME
  #         score += roll3
  #       elsif next_frame_roll1 != 0
  #         score += next_frame_roll1
  #       else
  #         score += next_frame_roll2
  #       end
  #     end
  #   }
  #   score
  # end
end
