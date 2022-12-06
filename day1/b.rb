data = File.read("./input.txt")

class Elf
	def initialize(data)
		@data = data
	end

	def calories
		@data.split("\n").map(&:to_i).inject(&:+)
	end
end

max_elves = data.split("\n\n").map {|d| Elf.new(d)}.sort_by {|e| e.calories}.reverse.take(3)
puts max_elves.map(&:calories).inject(&:+)
