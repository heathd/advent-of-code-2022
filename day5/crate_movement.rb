
class CrateMovement
	attr_reader :input

	def initialize(input)
		@input = input
	end

	def start_arrangement
		StartArrangementParser.new(input.split(/^$/)[0]).parse
	end

	def moves
		MoveListParser.new(input.split(/^$\n/)[1]).parse
	end

	def apply_moves
		moves.inject(start_arrangement) do |start_arrangement, move|
			move.apply(start_arrangement)
		end
	end
	
	def start_pos
		%w{A B}
	end
end

