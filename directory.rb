# lets put all students into an array, so we prevent future dificulaty in updating the code or even worse, nasty bugs running wild inside the code
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates",
]
#and the print all the students
puts "The students of Villains Academy"
puts "----------------"
students.each do |student|
  puts student
end
# we print the total number of students here
puts "Overall, we have  #{students.count} great students"
