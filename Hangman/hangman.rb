def contains?(character,key,current_word,guess_count,streak,score)
  if key.include?(character)
    i = 0
    if(current_word[key.index(character)] == "-")
      while key[i..key.length].include?(character)
        current_word[key[i..key.length].index(character) + i] = character
        i = key[i..key.length].index(character) + i + 1
      end
      streak += 1
      score += streak * 10
    end
    puts "Cool..."
  else
    guess_count -= 1
    streak = 0
    puts "Oops!..."
  end
  return guess_count,score,streak
end

dictionary = {
  'WATER'=>'I am also known as life',
  'PYTHON'=>'Programming language',
  'APPLE'=>'I am a fruit and there is famous phrase on me',
  'UBUNTU'=>'I am an OS. My name means Humanity',
  'KALILINUX'=>'I am an OS. My name contains name of indian goddess',
  'DEMOCRACY'=>'of the people, for the people, by the people',
  'ANDROMEDA'=>'Galaxy name'
  }
score = 0
puts '-----Welcome to Hangman-----'
dictionary.each do |key,val|
  puts "Hint: => #{val}"
  guess_count = 3
  current_word = ""
  streak = 0
  for i in 1..key.length do
    current_word += "-"
  end
  while current_word != key && !guess_count.zero?
    puts "Your score: #{score}   Remaining Guesses: #{guess_count}"
    puts "\t#{current_word}"
    print "Enter Character: "
    character = gets[0].upcase
    new_values = contains?(character,key,current_word,guess_count,streak,score)
    guess_count = new_values[0]
    score = new_values[1]
    streak = new_values[2]
  end
  if guess_count.zero?
    puts "Your Final Score: #{score}"
    puts "Better luck next time..."
    exit
  else
    puts "Bravo!!! You did it."
    print "Do you want to continue?..."
    choice = gets[0]
    unless choice == "y" || choice == "Y"
      exit
    end
  end
end
