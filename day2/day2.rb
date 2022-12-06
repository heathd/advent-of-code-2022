require File.dirname(__FILE__) + "/round"
data = File.read(File.dirname(__FILE__) + "/input.txt").split("\n")
puts data.map {|l| Round.new(l).score}.inject(&:+)