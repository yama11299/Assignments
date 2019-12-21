class Account
  @@acc_cnt=0
  attr_reader :acc_type, :acc_no, :balance, :cust_nm

  def initialize(type,name,amount)
    @@acc_cnt += 1
    @acc_no = @@acc_cnt
    @acc_type = type
    @cust_nm = name
    @balance = amount   
  end
  
  protected
  def withdraw(amount)
    @balance -= amount
  end
  protected
  def deposite
    print "Enter amount: "
    amount = gets.to_f
    @balance += amount
    return amount
  end
  protected
  def chkbalance
    puts "Balance amount: #{@balance}"
  end
end
