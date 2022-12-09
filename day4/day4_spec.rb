require File.dirname(__FILE__) + "/lib"

RSpec.describe "day4" do
	describe SectionAssignmentList do
		let(:input) {
			%{2-4,6-8
				2-3,4-5
				5-7,7-9
				2-8,3-7
				6-6,4-6
				2-6,4-8}.gsub(/^ +/, '')
		}

		subject(:section_assignment_list) { SectionAssignmentList.new(input) }

		it "parses the input" do
			expect(section_assignment_list.pairs[0].assignment(1).range).to eq(2..4)
			expect(section_assignment_list.pairs[0].assignment(2).range).to eq(6..8)
		end

		it "detects pairs where one assignment fully covers the other" do
			covering_pairs = section_assignment_list.pairs.select {|p| p.assignment_covers_other? }
			expect(covering_pairs.size).to eq(2)
			expect(covering_pairs).to eq(
				[
					AssignmentPair.new("2-8,3-7"),
					AssignmentPair.new("6-6,4-6")
				]
				)
		end

		it "detects pairs which overlap at all" do
			covering_pairs = section_assignment_list.pairs.select {|p| p.assignment_overlaps_other? }
			expect(covering_pairs).to eq(
				[
					AssignmentPair.new("5-7,7-9"),
					AssignmentPair.new("2-8,3-7"),
					AssignmentPair.new("6-6,4-6"),
					AssignmentPair.new("2-6,4-8")
				]
			)
		end

	end

	describe Assignment do
		subject(:a) { Assignment.new("2-4") }

		it "can tell if it overlaps another assignemnt" do
			expect(a.overlaps?(Assignment.new("2-2"))).to be_truthy
			expect(a.overlaps?(Assignment.new("3-3"))).to be_truthy
			expect(a.overlaps?(Assignment.new("4-4"))).to be_truthy
			expect(a.overlaps?(Assignment.new("5-5"))).to be_falsey
			expect(a.overlaps?(Assignment.new("4-5"))).to be_truthy
			expect(a.overlaps?(Assignment.new("2-7"))).to be_truthy
			expect(a.overlaps?(Assignment.new("1-7"))).to be_truthy
			expect(a.overlaps?(Assignment.new("1-2"))).to be_truthy
			expect(a.overlaps?(Assignment.new("1-1"))).to be_falsey
		end
	end
end