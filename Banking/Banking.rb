load 'SavingAcc.rb'
load 'CurrentAcc.rb'
Accounts=Array.new
choice="Y"

while choice=="Y"
  puts "----Bank of XYZ----"
  puts " 1.Create Account"
  puts " 2.Deposit Money"
  puts " 3.Withdraw Money"
  puts " 4.Check Balance"
  puts " 5.Calculate Interest"
  puts " 6.Exit"
  print "Enter Operation: "
  operation= gets.to_i

  case (operation)
  when 1
    print "Account Type: "
    type = gets.chomp
    print "Enter Name: "
    name = gets.chomp
    print "Enter amount for deposit: "
    amount = gets.to_f
    case type
    when "Savings"
      if amount >= SavingAcc.min_balance
        newAcc = SavingAcc.new(name,amount)
        Accounts << newAcc
      else
        puts "Minimum amount should be #{SavingAcc.min_balance}"
      end
    when "Current"
      if amount >= CurrentAcc.min_balance
        newAcc = CurrentAcc.new(name,amount)
        Accounts << newAcc
      else
        puts "Minimum amount should be #{CurrentAcc.min_balance}"
      end
    end
	when 2
    print "Account No: "
    acc_no = gets.to_i-1
    if Accounts[acc_no]
      Accounts[acc_no].deposite
    else
      puts "Invalid Account Number !!!"
    end
  when 3
    print "Account No: "
    acc_no = gets.to_i-1
    if Accounts[acc_no]
      print "Enter amount: "
      Accounts[acc_no].withdraw(gets.to_f)
    else
      puts "Invalid Account Number !!!"
    end
  when 4
    print "Account No: "
    acc_no = gets.to_i-1
    if Accounts[acc_no]
      Accounts[acc_no].chkbalance
    else
      puts "Invalid Account Number !!!"
    end
  when 5
    print "Account No: "
    acc_no = gets.to_i-1
    if Accounts[acc_no]
      print "Enter months: "
      months = gets.to_i
      Accounts[acc_no].calc_interest(months)
    else
      puts "Invalid Account Number !!!"
    end
  when 6
    choice="N"
	else
    puts "Invalid Operation"
  end
end