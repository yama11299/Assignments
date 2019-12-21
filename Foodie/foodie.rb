$menu={
    "PAVBHAJI"=>70,"DOSA"=>30,"CHHOLE BHATURE"=>80,"PULAV"=>60,
    "PIZZA"=>99,"PASTA"=>65,"MANCHURIAN"=>70,"BURGER"=>50,
    "UTTAPPA"=>35,"HAKKA NOODLES"=>65,"PANEER CHILLI"=>80
    }

load 'OrderManager.rb'
O1=OrderManager.new
choice="Y"
while choice=="Y"||choice=="y"
  puts "----Order Management System----"
  puts " 1.Take Order"
  puts " 2.Change Status"
  puts " 3.Display Order"
  puts " 4.Exit"
  print "Which Operation: "
  op_no = gets.to_i
  case op_no
  when 1
    O1.takeOrder
  when 2
    print "Enter O_id: "
    id = gets.to_i-1
    O1.changeStatus(id)
  when 3
    print "Enter O_id: "
    id = gets.to_i-1
    O1.displayOrder(id)
  when 4
    choice="N"
  else
    puts "Invalid Operation"
  end
end