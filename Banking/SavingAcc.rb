load 'Account.rb'
class SavingAcc < Account
  attr_reader :min_balance
  @@roi=0.04
  @@min_balance=500

  def initialize(name,amount)
    super("Savings",name,amount)
    puts "Congrats Your savings account is created with id= #{@acc_no}"
  end

  def self.min_balance
    @@min_balance
  end

  def deposite
    amount = super
    puts "Rs.#{amount} is credited to your savings account"
  end

  def withdraw(amount)
    if @balance-amount >= @@min_balance
      super(amount)
      puts "Rs. #{amount} is debited from your savings account"
    else
      puts "You can't debit given amount"
    end
  end

  def chkbalance
    super
  end

  def calc_interest(months)
    amount = @@roi*months*@balance
    puts "Interested Amount: #{amount+@balance}"
  end

  def update_roi
    print "Enter new rate of interest: "
    @@roi= gets.to_f
    print "ROI Updated Successfully"
  end
end