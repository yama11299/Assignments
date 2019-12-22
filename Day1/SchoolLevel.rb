print "Enter Grades: "
grade = gets.to_i

case grade
when 1..5
  puts "Elementary"
when 6..8
  puts "Middle"
when 9..12
  puts "High School"
else
  puts "College"
end