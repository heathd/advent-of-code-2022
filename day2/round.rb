class Round
	def initialize(input_line)
		@play1, @play2 = input_line.split(" ")
	end

	def play1
		{
			"A" => :rock,
			"B" => :paper,
			"C" => :scissors,
		}.fetch(@play1)
	end

	def play2
		{
			"X" => :rock,
			"Y" => :paper,
			"Z" => :scissors,
		}.fetch(@play2)
	end

	def draw?
		play1 == play2
	end

	def win?
		[
			[:rock, :paper],
			[:paper, :scissors],
			[:scissors, :rock],
		].include?([play1, play2])
	end

	def score_for_play2
		{
			:rock => 1,
			:paper => 2,
			:scissors => 3
		}.fetch(play2)
	end

	def outcome
		if draw?
			:draw
		elsif win?
			:win
		else
			:lose
		end
	end

	def outcome_score
		{
			draw: 3,
			lose: 0,
			win: 6
		}.fetch(outcome)
	end

	def score
		score_for_play2 + outcome_score
	end
end