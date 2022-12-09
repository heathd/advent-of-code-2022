class StartArrangementParser
	attr_reader :lines

	def initialize(start_arrangement)
		@start_arrangement = start_arrangement
		@lines = start_arrangement.split("\n")
	end

	def parse
		columns = []

		lines.reverse[1..-1].each do |line|
			num_cols = num_cols(line)
			(1..num_cols).each do |column|
				columns[column-1] ||= []
				content = line[(column-1) * 4 + 1]
				columns[column-1] << content if content != " "
			end
		end
		columns
	end

	def num_cols(line)
		(line.size + 1)/4
	end
end
