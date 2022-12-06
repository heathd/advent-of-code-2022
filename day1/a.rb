data = File.read("./input.txt")

class Elf
	def initialize(data)
		@data = data
	end

	def calories
		@data.split("\n").map(&:to_i).inject(&:+)
	end
end

max_elf = data.split("\n\n").map {|d| Elf.new(d)}.max_by {|e| e.calories}
puts max_elf.calories
