
class Move
	attr_reader :crates, :from, :to

	def initialize(crates:, from:, to:)
		@crates = crates
		@from = from
		@to = to
	end

	def ==(other)
		self.crates == other.crates &&
		  self.from == other.from &&
		  self.to == other.to
	end

	def apply(stack)
		stack_being_moved = stack[from-1]
		stack_being_moved.size
		keep = stack[from-1][0...-crates]
		move = stack[from-1][-crates..-1]
		stack[from-1] = keep
		stack[to-1] = stack[to-1] + move.reverse
		stack
	end

	def inspect
		"<Move #{crates || "?"} crates from #{from || "?"} to #{to || "?"}>"
	end
end
