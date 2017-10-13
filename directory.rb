def rand_month
  months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december" ]
  month = months[rand(months.length)]
end

def input_students
  puts "please enter the names, previous careers and years of age of the students"
  puts "To finish,just hit return three times"
  students = []
  name = gets.chomp
  career = gets.chomp
  years = gets.chomp
  if !name.empty?
    students << {name: name, cohort: rand_month, prev_career: career, years_old: years}
    if students.count < 2
      puts "Now we have #{students.count} student"
    else students.count > 2
    puts "Now we have #{students.count} students"
    end
  elsif name.empty?
  puts "You haven't entered any students"
  else
  puts "please add next student's name, previous career and years of age"
    name = gets.chomp
    career = gets.chomp
    years = gets.chomp
  end
  students
  end

def print_header
  puts "The students of this month's cohort at Makers Academy"
  puts "----------------"
end

def prints(students)
  if students.count == 0
    puts "...No student entries"
  else
  students.each_with_index do |student, index|
    puts "#{index +=1}. #{student[:name]} (#{student[:cohort]} cohort), previously worked as #{student[:prev_career]}, but decided to change to career in coding at the age of #{student[:years_old]}"
  end
 end
end

def print_footer(names) # we print the total number of students here
unless names.count == 0 then
  puts "Overall, we have #{names.count} great students"
  end
end

#calling the methods to activate their function
students = input_students
print_header
prints(students)
print_footer(students)
