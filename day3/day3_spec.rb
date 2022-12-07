require File.dirname(__FILE__) + "/rucsac.rb"
require File.dirname(__FILE__) + "/group.rb"

RSpec.describe "day3" do
	context "example 1" do
		subject(:example) {"vJrwpWtwJgWrhcsFMMfFFhFp"}
		let(:rucsac) { Rucsac.new(example) }

		it "has vJrwpWtwJgWr in compartment 1" do
			expect(rucsac.compartment1).to eq("vJrwpWtwJgWr")
		end

		it "has hcsFMMfFFhFp in compartment 2" do
			expect(rucsac.compartment2).to eq("hcsFMMfFFhFp")
		end

		it "has p as common item" do
			expect(rucsac.common_item).to eq("p")
		end

		it "has priority 16" do
			expect(rucsac.priority).to eq(16)
		end
	end

	describe "Group" do
		context "example group" do
			let(:input_lines) {
				%w{
					vJrwpWtwJgWrhcsFMMfFFhFp
					jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
					PmmdzqPrVvPwwTWBwg
				}
			}

			subject(:group) { Group.new(input_lines) }
			
			it "identifies 'r' as the badge" do
				expect(group.badge).to eq('r')
			end

			it "has priority 16" do
				expect(group.priority).to eq(18)
			end
		end
	end
end