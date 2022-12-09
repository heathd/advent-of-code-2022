require File.dirname(__FILE__) + "/lib"

input = File.read(File.dirname(__FILE__) + "/input.txt")
s = SectionAssignmentList.new(input)
puts s.pairs.select {|p| p.assignment_overlaps_other?}.size
