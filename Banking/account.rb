class Account
  @@total_accounts = 0
  attr_reader :account_type, :account_no, :balance, :customer_name

  def initialize(type,name,amount)
    @@total_accounts += 1
    #@account_no = @@total_accounts
    @account_type = type
    @customer_name = name
    @balance = amount   
  end
  
  protected
  def withdraw(amount)
    @balance -= amount
  end

  def deposit
    print "Enter amount: "
    amount = Float(gets)
    @balance += amount
    return amount
  end

  def check_balance
    puts "Balance amount: #{@balance.round(2)}"
  end
end
