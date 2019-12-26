load 'order_manager.rb'
manager = OrderManager.new
choice = "Y"
while choice == "Y" || choice == "y"
  puts "----Order Management System----"
  puts " 1.Take Order"
  puts " 2.Change Status"
  puts " 3.Display Order"
  puts " 4.Exit"
  print "Which Operation: "
  op_no = gets.to_i
  begin
    case op_no
    when 1
      manager.take_order
    when 2
      print "Enter o_id: "
      id = Integer(gets)
      manager.change_status(id)
    when 3
      print "Enter o_id: "
      id = Integer(gets)
      manager.display_order(id)
    when 4
      choice = "N"
    else
      puts "Invalid Operation"
    end
  rescue TypeError,ArgumentError
    puts "Invalid Input !!!"
  end
end