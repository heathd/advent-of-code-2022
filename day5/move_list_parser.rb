
class MoveListParser
	attr_reader :input, :lines

	def initialize(input)
		@input = input
		@lines = input.split("\n")
	end

	def parse
		lines.map {|l| move(l)}
	end

	def move(line)
		if line.match(/move (\d+) from (\d+) to (\d+)/)
			Move.new(crates: $1.to_i, from: $2.to_i, to: $3.to_i)
		end
	end
end
