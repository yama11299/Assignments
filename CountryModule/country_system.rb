load("country.rb")
Countries = Hash.new
choice = "Y"
while choice == "Y" || choice == "y"
  begin
    puts "-----Operations-----"
    puts "1.Add new country"
    puts "2.Can apply for UN?"
    puts "3.Can win war?"
    puts "4.Can get loan from WB?"
    puts "5.Display all countries"
    puts "6.Exit"
    print "Enter Operation: "
    operation = Integer(gets)

    case operation
    when 1
      print "Enter Country Name: "
      country_name = gets.chomp.upcase
      exit puts "Country name should contain alphabets only" unless country_name.match(/^[A-Z]+\s?[A-Z]*\s?[A-Z]*$/)
      print "Enter Number of States: "
      no_of_states = Integer(gets)
      print "Enter Population: "
      population = Integer(gets)
      print "Enter GDP: "
      gdp = Float(gets)
      print "Enter Military Strength: "
      military_strength = Integer(gets)
      exit puts "Military strength can't be more than population" unless population > military_strength
      print "Enter status of country(Developing/Developed): "
      status = gets.chomp.upcase
      exit puts "Invaild status !!!" unless status == "DEVELOPING" || status == "DEVELOPED"
      country_details = Country.new
      country_details.add_country(no_of_states,population,gdp,military_strength,status)
      Countries.store(country_name,country_details)
      puts "Country added successfully..."

    when 2
      print "Country Name: "
      country_name = gets.chomp.upcase
      exit puts "No such country exists !!!" unless Countries.has_key?(country_name)
      Countries.fetch(country_name).can_register_for_UN?
      
    when 3
      print "Country Name: "
      country_name = gets.chomp.upcase
      exit puts "No such country exists !!!" unless Countries.has_key?(country_name)
      print "Rival Country Name: "
      rival_country_name = gets.chomp.upcase
      exit puts "No such country exists !!!" unless Countries.has_key?(rival_country_name)
      Countries.fetch(country_name).can_win_war?(Countries.fetch(rival_country_name))

    when 4
      print "Country Name: "
      country_name = gets.chomp.upcase
      exit puts "No such country exists !!!" unless Countries.has_key?(country_name)
      Countries.fetch(country_name).can_get_loan?

    when 5
      Countries.each do |country_name,country_info|
        puts "#{country_name} => "
        country_info.display_details
      end

    when 6
      exit
    
    else
      puts "Invalid Operation !!!"
    end
  
  rescue TypeError, ArgumentError
    puts "Invalid Input !!!"
  end
  
  print "Do you want to continue?(Y/N)... "
  choice = gets[0]
end
