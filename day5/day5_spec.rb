require File.dirname(__FILE__) + "/start_arrangement_parser"
require File.dirname(__FILE__) + "/move_list_parser"
require File.dirname(__FILE__) + "/move"
require File.dirname(__FILE__) + "/crate_movement"


RSpec.describe "day5" do
	describe Move do
		it "can be compared for equality" do
			expect(Move.new(crates:1, from: 2, to: 3)).to eq(Move.new(crates:1, from: 2, to: 3))
			expect([Move.new(crates:1, from: 2, to: 3)]).to eq([Move.new(crates:1, from: 2, to: 3)])
		end

		context do
			let(:stack_arrangement_text) {
				<<~INPUT_END
				[A] [B]
				 1   2
				INPUT_END
			}

			let(:stack) {
				StartArrangementParser.new(stack_arrangement_text).parse
			}
			let(:move1) {
				Move.new(crates: 1, from: 1, to: 2)
			}
			let(:move2) {
				Move.new(crates: 2, from: 2, to: 1)
			}

			it "can be applied to a stack arrangement" do
				expect(move1.apply(stack)).to eq([[], ["B", "A"]])
			end

			it "can be applied twice" do
				moved = move1.apply(stack)
				expect(move2.apply(moved)).to eq([["A", "B"], []])
			end
		end
	end

	context "simple input and instruction" do
		let(:input) {
			<<~INPUT_END
			[A] [B]
			 1   2

			move 1 from 1 to 2
			move 2 from 2 to 1
INPUT_END
		}

		subject(:crate_movement) {
			CrateMovement.new(input)
		}

		it "gets the start arrangement" do
			expect(crate_movement.start_arrangement).to eq([["A"], ["B"]])
		end

		it "gets the list of moves" do
			expect(crate_movement.moves).to eq(
				[
					Move.new(crates: 1, from: 1, to: 2),
					Move.new(crates: 2, from: 2, to: 1)
				]
			)
		end

		it "parses some input" do
			expect(crate_movement.start_pos).to eq(%w{A B})
		end
	end

	describe StartArrangementParser do
		it "parses the simplest arrangement" do
			expect(StartArrangementParser.new("[A]\n 1\n").parse).to eq([["A"]])
		end

		it "parses a two high arrangement" do
			arrangement = <<~HERE
			[B]
			[A]
			 1
			HERE
			expect(StartArrangementParser.new(arrangement).parse).to eq([["A", "B"]])
		end

		it "parses a two column arrangement" do
			arrangement = <<~HERE
			[B] 
			[A] [C]
			 1   2
			HERE
			expect(StartArrangementParser.new(arrangement).parse).to eq([["A", "B"], ["C"]])
		end

		it "parses a three column arrangement" do
			arrangement = <<~HERE
			[B]     [X]
			[A] [C] [Z]
			 1   2   3
			HERE
			expect(StartArrangementParser.new(arrangement).parse).to eq([["A", "B"], ["C"], ["Z", "X"]])
		end
	end
end
