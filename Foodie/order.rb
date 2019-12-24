class Order
  attr_accessor :items, :order_id, :customer, :status
  @@menu={
  "PAVBHAJI"=>70,"DOSA"=>30,"CHHOLE BHATURE"=>80,"PULAV"=>60,
  "PIZZA"=>99,"PASTA"=>65,"MANCHURIAN"=>70,"BURGER"=>50,
  "UTTAPPA"=>35,"HAKKA NOODLES"=>65,"PANEER CHILLI"=>80
  }
  @@order_count=0

  def Order.order_count
    @@order_count
  end
  
  def take_order
    self.order_id=@@order_count+1
    print "Customer Name: "
    customer = gets.chomp.upcase
    if customer.match(/^[A-Z]+\s?[A-Z]*\s?[A-Z]*$/)
      self.customer = customer
      flag = "Y"
      @items=Hash.new
      while flag=="Y" || flag=="y"
        display_menu
        print "Dish name: "
        dish = gets.chomp.upcase
        quantity_and_price = Array.new
        if @@menu.has_key?(dish)
          quantity_and_price << @@menu[dish]
          print "Enter quantity: "
          quantity_and_price << Integer(gets)
          self.items.store(dish,quantity_and_price)
          print "Do you want to add more item (Y/N): "
          flag = gets[0].chomp
        else
          print "Do you want to try another dish (Y/N): "
          flag = gets[0].chomp
        end
      end
      self.status="CONFIRMED"
      puts "Your order is placed"
      self.display_order
      @@order_count+=1
    else
      puts "Invalid Name !!!"
    end
  end

  def change_status
    print "Enter new status: "
    new_status = gets.chomp.upcase
    if new_status.match(/^[A-Z]+\s?[A-Z]*\s?[A-Z]*$/)
      self.status = new_status
    else
      puts "Invalid Status !!!"
    end
  end

  def display_order
    total=0
      print "o_id: #{self.order_id}\t"
      puts "Customer: #{self.customer}"
      puts "-----Ordered Details-----"
      self.items.each do |key,val|
        puts "#{key} => #{val[1]} x #{val[0]} = #{val[0]*val[1]}"
        total+=val[0]*val[1]
      end
      puts "Total Amount: Rs.#{total}"
      puts "Status: #{self.status}"
  end

  def display_menu
    puts "---MENU---"
    @@menu.each do |dish,price| 
      puts "#{dish}=>#{price}"
    end
  end
end