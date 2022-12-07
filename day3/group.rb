
class Group
	def initialize(input_lines)
		@rucsacs = input_lines.map {|l| l.each_char.to_a}
	end

	def badge
		@rucsacs.inject(&:&).first
	end

	def priority
		priority_list = ("a".."z").to_a + ("A".."Z").to_a
		priority_list.find_index(badge) + 1
	end
end
