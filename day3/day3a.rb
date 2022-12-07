require File.dirname(__FILE__) + "/group.rb"

lines = File.read(File.dirname(__FILE__) + "/input.txt").split("\n")

puts lines.each_slice(3).map {|g| Group.new(g).priority}.inject(&:+)

