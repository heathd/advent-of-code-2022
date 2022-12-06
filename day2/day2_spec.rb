require File.dirname(__FILE__) + '/round'
require File.dirname(__FILE__) + '/scorer'

RSpec.describe "day2" do
	let(:strategy_guide) {
%{
A Y
B X
C Z
}
	}

	describe Round do
		it "scores same plays as a draw" do
			expect(Round.new("A X").draw?).to be_truthy
			expect(Round.new("B Y").draw?).to be_truthy
			expect(Round.new("C Z").draw?).to be_truthy
		end

		it "scores differening plays not as a draw" do
			expect(Round.new("A Y").draw?).to be_falsy
			expect(Round.new("A Z").draw?).to be_falsy
			expect(Round.new("B X").draw?).to be_falsy
			expect(Round.new("B Z").draw?).to be_falsy
			expect(Round.new("C X").draw?).to be_falsy
			expect(Round.new("C Y").draw?).to be_falsy
		end

		it "scores the play" do
			expect(Round.new("A X").score_for_play2).to eq(1)
			expect(Round.new("A Y").score_for_play2).to eq(2)
			expect(Round.new("A Z").score_for_play2).to eq(3)
		end

		it "calculates the outcome" do
			expect(Round.new("A X").outcome).to eq(:draw)
			expect(Round.new("A Y").outcome).to eq(:win)
			expect(Round.new("A Z").outcome).to eq(:lose)
		end

		it "scores the outcome" do
			expect(Round.new("A X").outcome_score).to eq(3)
			expect(Round.new("A Y").outcome_score).to eq(6)
			expect(Round.new("A Z").outcome_score).to eq(0)
		end

		it "calculates the total score" do
			expect(Round.new("A Y").score).to eq(8)
			expect(Round.new("B X").score).to eq(1)
			expect(Round.new("C Z").score).to eq(6)
		end
	end

# In the first round, your opponent will choose Rock (A), and you should choose Paper (Y).
 # This ends in a win for you with a score of 8 (2 because you chose Paper + 6 because you won).
# In the second round, your opponent will choose Paper (B), and you should choose Rock (X). This ends in a loss for you with a score of 1 (1 + 0).
# The third round is a draw with both players choosing Scissors, giving you a score of 3 + 3 = 6.
	
end