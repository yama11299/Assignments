load 'order.rb'
class OrderManager
  def initialize
    puts "System Started..."
    @orders = Hash.new
  end

  def take_order
    order=Order.new
    order.take_order
    @orders.store(Order.order_count,order)
  end

  def change_status(id)
    if @orders.has_key?(id)
      @orders.fetch(id).change_status
    else
      puts "No order available"
    end
  end

  def display_order(id)
    if @orders.has_key?(id)
      @orders.fetch(id).display_order
    else
      puts "No order available"
    end
  end
end