load 'order.rb'
MENU = {
  "PAVBHAJI"=>70,"DOSA"=>30,"CHHOLE BHATURE"=>80,"PULAV"=>60,
  "PIZZA"=>99,"PASTA"=>65,"MANCHURIAN"=>70,"BURGER"=>50,
  "UTTAPPA"=>35,"HAKKA NOODLES"=>65,"PANEER CHILLI"=>80
}
class OrderManager
  def initialize
    puts "System Started..."
    @orders = Hash.new
  end

  def take_order
    print 'Customer Name: '
    customer = gets.chomp.upcase
    return puts 'Invalid Name !!!' unless customer.match(/^[A-Z]+\s?[A-Z]*\s?[A-Z]*$/)
    flag = "Y"
    items = Hash.new
    while flag == "Y" || flag == "y"
      display_menu
      print 'Dish name: '
      dish = gets.chomp.upcase
      if MENU.has_key?(dish)
        quantity_and_price = Array.new
        quantity_and_price << MENU[dish]
        print 'Enter quantity: '
        quantity_and_price << Integer(gets)
        return puts 'Quantity can\'t be 0' unless !quantity_and_price[1].zero?
        items.store(dish,quantity_and_price)
        print 'Do you want to add more item (Y/N): '
        flag = gets[0].chomp
      else
        print 'Do you want to try another dish (Y/N): '
        flag = gets[0].chomp
      end
    end
    if !items.empty?
      order = Order.new
      order.take_order(customer,items)
      @orders.store(Order.order_count,order)
    end
  end

  def change_status(id)
    return puts "No order available" unless @orders.has_key?(id)
    print 'Enter new status: '
    new_status = gets.chomp.upcase
    return puts 'Invalid Status !!!' unless new_status.match(/^[A-Z]+\s?[A-Z]*\s?[A-Z]*$/)    
    @orders.fetch(id).change_status(new_status)
  end

  def display_order(id)
    return puts "No order available" unless @orders.has_key?(id)
    @orders.fetch(id).display_order
  end

  def display_menu
    puts '---MENU---'
    MENU.each do |dish,price| 
      puts "#{dish}=>#{price}"
    end
  end
end