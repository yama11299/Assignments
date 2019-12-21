class Order
  attr_accessor :items, :oid, :cust_nm, :status 
  @@ocnt=1
  def initialize
    @oid=@@ocnt
    @cust_nm
    @status
    @items=Hash.new
  end

  def takeOrder
    print "Customer Name: "
    self.cust_nm = gets.chomp
    flag = "Y"
    while flag=="Y" || flag=="y"
      print "Dish name: "
      dnm = gets.chomp.upcase
      qty_amt = Array.new
      if $menu.has_key?(dnm)
        qty_amt << $menu[dnm]
        print "Enter quantity: "
        qty_amt << gets.to_i
        self.items.store(dnm,qty_amt)
        print "Do you want to add more item: "
        flag = gets.chomp
      else
        print "Do you want to try another dish: "
        flag = gets.chomp
      end
    end
    self.status="CONFIRMED"
    puts "Your order is placed"
    self.displayOrder
  end

  def changeStatus
    print "Enter new status: "
    self.status = gets.chomp
  end

  def displayOrder
    total=0
      puts "O_id: #{self.oid}"
      puts "Customer: #{self.cust_nm}"
      puts "-----Ordered Details-----"
      self.items.each do |key,val|
        puts "#{key} => #{val[1]} x #{val[0]} = #{val[0]*val[1]}"
        total+=val[0]*val[1]
      end
      puts "Total Amount: Rs.#{total}"
      puts "Status: #{self.status}"
  end
end