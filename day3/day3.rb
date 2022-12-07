require File.dirname(__FILE__) + "/rucsac.rb"

data = File.read(File.dirname(__FILE__) + "/input.txt")

puts data.split("\n").map {|d| Rucsac.new(d).priority}.inject(&:+)