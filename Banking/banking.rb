load 'saving_account.rb'
load 'current_account.rb'
savings_accounts = Hash.new
current_accounts = Hash.new
choice = "Y"
while choice == "Y" || choice == "y"
  begin
    puts "----Bank of XYZ----"
    puts " 1.Create Account"
    puts " 2.Deposit Money"
    puts " 3.Withdraw Money"
    puts " 4.Check Balance"
    puts " 5.Calculate Interest"
    puts " 6.Exit"
    print "Enter Operation: "
    operation = Integer(gets)
    case (operation)
    when 1
      print "Account Type: "
      type = gets.chomp.upcase
      case type
      when "SAVINGS"
        print "Enter Name: "
        name = gets.chomp.upcase
        return puts "Invalid Name !!!" unless name.match(/^[A-Z]+\s?[A-Z]*$/)
        print "Enter amount for deposit: "
        amount = Float(gets)
        if amount >= SavingAccount.minimum_balance
          new_account = SavingAccount.new(name,amount)
          savings_accounts.store(new_account.account_no,new_account)
        else
          puts "Minimum amount should be #{SavingAccount.minimum_balance}"
        end
      when "CURRENT"
        print "Enter Name: "
        name = gets.chomp.upcase
        return puts "Invalid Name !!!" unless name.match(/^[A-Z]+\s?[A-Z]*$/)
        print "Enter amount for deposit: "
        amount = Float(gets)
        if amount >= CurrentAccount.minimum_balance
          new_account = CurrentAccount.new(name,amount)
          current_accounts.store(new_account.account_no,new_account)
        else
          puts "Minimum amount should be #{CurrentAccount.minimum_balance}"
        end
      else
        puts "Invalid Account Type !!!"
      end
    when 2
      print "Account Type: "
      type = gets.chomp.upcase
      case type
      when "SAVINGS"
        print "Account No: "
        account_no = Integer(gets)
        return puts "Invalid Account Number !!!" unless savings_accounts.has_key?(account_no)
        savings_accounts.fetch(account_no).deposit
      when "CURRENT"
        print "Account No: "
        account_no = Integer(gets)
        return puts "Invalid Account Number !!!" unless current_accounts.has_key?(account_no)
        current_accounts.fetch(account_no).deposit
      else
        puts "Invalid Account Type !!!"
      end
    when 3
      print "Account Type: "
      type = gets.chomp.upcase
      case type
      when "SAVINGS"
        print "Account No: "
        account_no = Integer(gets)
        return puts "Invalid Account Number !!!" unless savings_accounts.has_key?(account_no)
        print "Enter amount: "
        savings_accounts.fetch(account_no).withdraw(Float(gets))
      when "CURRENT"
        print "Account No: "
        account_no = Integer(gets)
        return puts "Invalid Account Number !!!" unless current_accounts.has_key?(account_no)
        print "Enter amount: "
        current_accounts.fetch(account_no).withdraw(Float(gets))
      else
        puts "Invalid Account Type !!!"
      end
    when 4
      print "Account Type: "
      type = gets.chomp.upcase
      case type
      when "SAVINGS"
        print "Account No: "
        account_no = Integer(gets)
        return puts "Invalid Account Number !!!" unless savings_accounts.has_key?(account_no)
        savings_accounts.fetch(account_no).check_balance
      when "CURRENT"
        print "Account No: "
        account_no = Integer(gets)
        return puts "Invalid Account Number !!!" unless current_accounts.has_key?(account_no)
        current_accounts.fetch(account_no).check_balance  
      else
        puts "Invalid Account Type !!!"
      end
    when 5
      print "Account Type: "
      type = gets.chomp.upcase
      case type
      when "SAVINGS"
        print "Account No: "
        account_no = Integer(gets)
        return puts "Invalid Account Number !!!" unless savings_accounts.has_key?(account_no)
        print "Enter months: "
        months = Integer(gets)
        savings_accounts.fetch(account_no).calculate_interest(months)
      when "CURRENT"
        print "Account No: "
        account_no = Integer(gets)
        return puts "Invalid Account Number !!!" unless current_accounts.has_key?(account_no)
        print "Enter months: "
        months = Integer(gets)
        current_accounts.fetch(account_no).calculate_interest(months)    
      else
        puts "Invalid Account Type !!!"
      end
    when 6
      choice = "N"
    else
      puts "Invalid Operation"
    end
  rescue ArgumentError, TypeError 
    puts "Invalid Input !!!"
  end
end