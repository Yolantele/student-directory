# lets put all students into an array, so we prevent future dificulaty in updating the code or even worse, nasty bugs running wild inside the code
students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]
#and the print all the students
def print_header
  puts "The students of Villains Academy"
  puts "----------------"
end

def prints(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names) # we print the total number of students here
puts "Overall, we have #{names.count} great students"
end
#calling the methods to activate their function
print_header
prints(students)
print_footer(students)
