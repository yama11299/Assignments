class Order
  attr_accessor :items, :order_id, :customer, :status
  @@order_count = 0

  def Order.order_count
    @@order_count
  end
  
  def take_order(customer,items)
    self.order_id = @@order_count + 1
    self.customer = customer
    self.items = items    
    self.status = "CONFIRMED"
    puts 'Your order is placed'
    display_order
    @@order_count += 1    
  end

  def change_status(new_status)
    self.status = new_status
  end

  def display_order
    total = 0
    print "o_id: #{self.order_id}\t"
    puts "Customer: #{self.customer}"
    puts '-----Ordered Details-----'
    self.items.each do |key,val|
      puts "#{key} => #{val[1]} x #{val[0]} = #{val[0] * val[1]}"
      total += val[0] * val[1]
    end
    puts "Total Amount: Rs.#{total}"
    puts "Status: #{self.status}"
  end
end