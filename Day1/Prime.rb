#program to check whether no is prime or not
puts "Enter number: "
no = gets.to_i
i=2
flag=0;
if no == 1 
	puts "1 is neither prime nor composite number"
	flag+=1
elsif no == 2
	puts "2 is prime number"
	flag+=1
else
while i <= no/2 do
	if no%i == 0
		puts no.to_s+" is not prime number"
		flag+=1
		break
	end
	i+=1
end
end
if (flag==0)
	puts no.to_s+" is a prime number" 
end

