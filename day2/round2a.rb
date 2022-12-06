class RoundA
	def initialize(input_line)
		@play1, @outcome = input_line.split(" ")
	end

	def play1
		{
			"A" => :rock,
			"B" => :paper,
			"C" => :scissors
		}.fetch(@play1)
	end

	def play2
		if outcome == :draw
			play1
		elsif outcome == :win
			winning_play_for(play1)
		else
			losing_play_for(play1)
		end
	end

	def outcome
		{
			"X" => :lose,
			"Y" => :draw,
			"Z" => :win
		}.fetch(@outcome)
	end

	def winning_play_for(opening_play)
		{
			:rock => :paper,
			:paper => :scissors,
			:scissors => :rock
		}.fetch(opening_play)
	end

	def losing_play_for(opening_play)
		{
			:rock => :scissors,
			:paper => :rock,
			:scissors => :paper
		}.fetch(opening_play)
	end

	def score_for_play2
		{
			:rock => 1,
			:paper => 2,
			:scissors => 3
		}.fetch(play2)
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