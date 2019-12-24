print "Enter gender: "
gender= gets.chomp
if gender.match(/^[MmFf]${1}/)
	puts "Valid Input"
elsif gender.match(/Male,male,MALE/)
	puts "Valid Input"
elsif gender.match(/female,Female,FEMALE/)
  puts "Valid Input"
else
	puts "Invalid Input"
end

print "Enter Email Id: "
email= gets.chomp
if email.match(/^[0-9a-zA-Z]+[_.]*[0-9a-zA-Z_]*@[a-zA-Z]+\.[a-zA-Z]{3}$/)
  puts "Valid Email Id"
else
  puts "Invalid Email Id !!!"
end

print "Enter Mobile Number: "
number = gets.chomp
if number.match(/^[1-9][0-9]{9}$/)
  puts "Valid Mobile Number"
else
  puts "Invalid Mobile Number !!!"
end

print "Enter Amount: "
amount = gets.chomp
if amount.match(/^[0-9]*\.?[0-9]+$/)
  puts "Valid Amount"
else
  puts "Invalid Amount !!!"
end