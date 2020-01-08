#program to check whether number is prime or not
begin
  print "Enter number: "
  number = Integer(gets)
  return puts "1 is neither prime nor composite" if number == 1
  if (2..number - 1).none? { |denominator| number % denominator == 0 }
    puts "#{number} is a prime number."
  else 
    puts "#{number} is not a prime number."
  end
rescue ArgumentError, InputError
  puts "Invalid Input !!!"
end
