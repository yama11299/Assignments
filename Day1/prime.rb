#program to check whether number is prime or not
puts "Enter number: "
number = gets.to_i
i=2
flag=0
if number == 1 
	puts "1 is neither prime nor composite number"
	flag+=1
elsif number == 2
	puts "2 is prime number"
	flag+=1
else
while i <= number/2
	if number%i == 0
		puts "#{number} is not prime number"
		flag+=1
		break
	end
	i+=1
end
end
if (flag==0)
	puts "#{number} is a prime number" 
end
