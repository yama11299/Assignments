load 'Order.rb'
class OrderManager
  def initialize
    puts "System Started..."
    @orders = Array.new
  end

  def takeOrder
    order=Order.new
    order.takeOrder
    @orders << order
  end

  def changeStatus(id)
    if @orders[id]
      @orders[id].changeStatus
    else
      puts "No order available"
    end
  end

  def displayOrder(id)
    if @orders[id]
      @orders[id].displayOrder
    else
      puts "No order available"
    end
  end
end