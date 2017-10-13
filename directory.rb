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
"Norman Bates"
]
#and the print all the students
def print_header
  puts "The students of Villains Academy"
  puts "----------------"
end

def prints(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names) # we print the total number of students here
puts "Overall, we have  #{names.count} great students"
end
#calling the methods to activate their function
print_header
prints(students)
print_footer(students)
