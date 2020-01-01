module CountryModule
  attr_reader :military_strength
  def add_country(no_of_states, population, gdp, military_strength, status)
    @no_of_states = no_of_states
    @population = population
    @gdp = gdp
    @military_strength = military_strength
    @status = status
  end
  
  def can_get_loan?
    return puts "Unfortunately Your country is not eligible to get loan." unless @gdp >= 4.5 && @status == "DEVELOPING" || @status == "DEVELOPED"
    puts "Yes. Your country can get loan."
  end
  
  def can_win_war?(rival_country_name)
    return puts "Your country will defeat in war." unless @military_strength >= rival_country_name.military_strength
    puts "Your country can win in war."
  end
  
  def can_register_for_UN?
    return puts "Your country can't register for UN." unless @gdp >= 3 && @population >= 10000000 || @status == "DEVELOPED"
    puts "Your country can register for UN."
  end

  def display_details
    puts "\tPopulation: #{@population}"
    puts "\tNo of states: #{@no_of_states}"
    puts "\tMilitary strength: #{@military_strength}"
    puts "\tGDP: #{@gdp}"
    puts "\tStatus: #{@status}"
  end
end