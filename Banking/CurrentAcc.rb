load 'Account.rb'
class CurrentAcc < Account
  attr_reader :min_balance
  @@roi=0.02
  @@min_balance=1000

  def initialize(name,amount)
    super("Current",name,amount)
    puts "Congrats your current account is created with Id= #{@acc_no}"
  end
  
  def self.min_balance
    @@min_balance
  end

  def deposite
    amount=super
    puts "Rs. #{amount} is credited to your current account"
  end

  def withdraw(amount)
    if @balance-amount >= @min_balance
      super(amount)
      puts "Rs. #{amount} is debited from your current account"
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
