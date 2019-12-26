load 'account.rb'
class SavingAccount < Account
  #attr_reader :minimum_balance
  @@rate_of_interest = 0.04
  @@minimum_balance = 500
  @@total_savings_accounts = 0
  def initialize(name,amount)
    super("SAVINGS",name,amount)
    @@total_savings_accounts += 1
    @account_no = @@total_savings_accounts 
    puts "Congrats Your savings account is created with id= #{@account_no}"
  end

  def self.minimum_balance
    @@minimum_balance
  end

  def deposite
    amount = super
    puts "Rs.#{amount} is credited to your savings account"
  end

  def withdraw(amount)
    if @balance-amount >= @@minimum_balance
      super(amount)
      puts "Rs. #{amount} is debited from your savings account"
    else
      puts "You can't debit given amount"
    end
  end

  def check_balance
    super
  end

  def calculate_interest(months)
    amount = @@rate_of_interest*months*@balance
    puts "Interested Amount: #{amount+@balance}"
  end

  def update_interest_rate
    print "Enter new rate of interest: "
    @@rate_of_interest = gets.to_f
    puts "ROI Updated Successfully"
  end
end