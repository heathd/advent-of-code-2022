require File.dirname(__FILE__) + "/start_arrangement_parser"
require File.dirname(__FILE__) + "/move_list_parser"
require File.dirname(__FILE__) + "/move"
require File.dirname(__FILE__) + "/crate_movement"

end_arrangement = CrateMovement.new(File.read(File.dirname(__FILE__) + "/input.txt")).apply_moves9001

puts end_arrangement.map {|column| column.last}.join