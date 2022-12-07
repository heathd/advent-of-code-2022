class Rucsac
	attr_reader :content

	def initialize(content)
		@content = content
	end

	def compartment1
		content[0 ... content.size/2]
	end

	def compartment2
		content[content.size/2 .. content.size-1]
	end

	def common_item
		char = compartment1.each_char.select {|c| compartment2.include?(c)}
		if char.any?
			char.first
		else
			nil
		end
	end

	def priority
		priority_list = ("a".."z").to_a + ("A".."Z").to_a
		priority_list.find_index(common_item) + 1
	end
end
