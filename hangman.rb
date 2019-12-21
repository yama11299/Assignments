def contains? (ch,key,curr_word,guess_cnt,streak,score)
  if key.include?(ch)
    i=0
    if(curr_word[key.index(ch)]=="-")
      while key[i..key.length].include?(ch)
        curr_word[key[i..key.length].index(ch)+i] = ch
        i = key[i..key.length].index(ch)+i+1
      end
      streak += 1
      score += streak*10
    end
    puts "Cool..."
    return guess_cnt,score,streak
  else
    guess_cnt-=1
    streak=0
    puts "Oops!..."
    return guess_cnt,score,streak
  end
end

dictionary={
  "WATER"=>"I am also known as life",
  "PYTHON"=>"Programming language",
  "APPLE"=>"I am a fruit and there is famous phrase on me",
  "UBUNTU"=>"I am an OS. My name means Humanity",
  "KALILINUX"=>"I am an OS. My name contains name of indian goddess",
  "DEMOCRACY"=>"of the people, for the people, by the people",
  "ANDROMEDA"=>"Galaxy name"
  }
score=0
puts "-----Welcome to Hangman-----"
dictionary.each do |key,val|
  puts "Hint: => #{val}"
  guess_cnt=3
  curr_word=""
  streak=0
  for i in 1..key.length do
    curr_word += "-"
  end
  while curr_word != key && guess_cnt != 0
    puts "Your score: #{score}   Remaining Guesses: #{guess_cnt}"
    puts "\t#{curr_word}"
    print "Enter Character: "
    ch = gets[0].upcase
    new_values = contains?(ch,key,curr_word,guess_cnt,streak,score)
    guess_cnt = new_values[0]
    score = new_values[1]
    streak = new_values[2]
  end
  if(guess_cnt==0)
    puts "Your Final Score: #{score}"
    puts "Better luck next time..."
    exit
  else
    puts "Bravo!!! You did it."
  end
end