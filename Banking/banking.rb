load 'saving_account.rb'
load 'current_account.rb'
Accounts=Array.new
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
        if name.match(/^[A-Z]+\s?[A-Z]*$/)
          print "Enter amount for deposit: "
          amount = Float(gets)
          if amount >= SavingAccount.minimum_balance
            newAcc = SavingAccount.new(name,amount)
            Accounts << newAcc
          else
            puts "Minimum amount should be #{SavingAccount.minimum_balance}"
          end
        else
          puts "Invalid Name !!!"
        end
      when "CURRENT"
        print "Enter Name: "
        name = gets.chomp.upcase
        if name.match(/^[A-Z]+\s?[A-Z]*$/)
          print "Enter amount for deposit: "
          amount = Float(gets)
          if amount >= CurrentAccount.minimum_balance
            newAcc = CurrentAccount.new(name,amount)
            Accounts << newAcc
          else
            puts "Minimum amount should be #{CurrentAccount.minimum_balance}"
          end
        else
          puts "Invalid Name !!!"
        end
      else
        puts "Invalid Account Type !!!"
      end
    when 2
      print "Account No: "
      account_no = Integer(gets)-1
      if Accounts[account_no]
        Accounts[account_no].deposite
      else
        puts "Invalid Account Number !!!"
      end
    when 3
      print "Account No: "
      account_no = Integer(gets)-1
      if Accounts[account_no]
        print "Enter amount: "
        Accounts[account_no].withdraw(Float(gets))
      else
        puts "Invalid Account Number !!!"
      end
    when 4
      print "Account No: "
      account_no = Integer(gets)-1
      if Accounts[account_no]
        Accounts[account_no].check_balance
      else
        puts "Invalid Account Number !!!"
      end
    when 5
      print "Account No: "
      account_no = Integer(gets)-1
      if Accounts[account_no]
        print "Enter months: "
        months = Integer(gets)
        Accounts[account_no].calculate_interest(months)
      else
        puts "Invalid Account Number !!!"
      end
    when 6
      choice="N"
    else
      puts "Invalid Operation"
    end
  rescue ArgumentError, TypeError 
    puts "Invalid Input !!!"
  end
end