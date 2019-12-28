load 'account.rb'
class CurrentAccount < Account
  #attr_reader :minimum_balance
  @@rate_of_interest = 0.02
  @@minimum_balance = 1000
  @@total_current_accounts = 0
  def initialize(name,amount)
    super("CURRENT",name,amount)
    @@total_current_accounts += 1
    @account_no = @@total_current_accounts
    puts "Congrats your current account is created with Id= #{@account_no}"
  end
  
  def self.minimum_balance
    @@minimum_balance
  end

  def deposit
    amount = super
    puts "Rs. #{amount} is credited to your current account"
  end

  def withdraw(amount)
    if @balance - amount >= @@minimum_balance
      super(amount)
      puts "Rs. #{amount} is debited from your current account"
    else
      puts "You can't debit given amount"
    end
  end

  def check_balance
    super
  end

  def calculate_interest(months)
    amount = @@rate_of_interest * months * @balance
    puts "Interested Amount: #{amount + @balance}"
  end

  def update_interest_rate
    print "Enter new rate of interest: "
    @@rate_of_interest = gets.to_f
    puts "ROI Updated Successfully"
  end
end