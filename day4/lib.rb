class Assignment
	attr_reader :range

	def initialize(range_input)
		from,to = range_input.split("-").map(&:to_i)
		@range = from..to
	end

	def ==(other)
		if other.is_a?(Range)
			self.range == other
		else
			self.range == other.range
		end
	end

	def cover?(other)
		self.range.cover?(other.range)
	end
end

class AssignmentPair
	attr_reader :assignments

	def initialize(line)
		@assignments = line.split(",").map {|a| Assignment.new(a)}
	end

	def assignment(n)
		@assignments[n-1]
	end

	def assignment_covers_other?
		a1, a2 = @assignments
		a1.cover?(a2) || a2.cover?(a1)
	end

	def ==(other)
		self.assignments == other.assignments
	end
end

class SectionAssignmentList
	attr_reader :pairs

	def initialize(input)
		@lines = input.split("\n")
		@pairs = @lines.map {|l| AssignmentPair.new(l) }
	end

	def pair(n)
		@pairs[n-1]
	end
end
