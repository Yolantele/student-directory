@students = [] # an empty array accessible accross all methods.

def rand_month
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
  month = months[rand(months.length)]
end

def input_students
  puts "please enter the names, previous careers and years of age of the students"
  puts "To finish,just hit return three times"
  name = gets.chomp
  career = gets.chomp
  years = gets.chomp
  if !name.empty?
    @students << {name: name, cohort: rand_month, prev_career: career, years_old: years}
    if @students.count < 2
      puts "Now we have #{@students.count} student"
    else @students.count > 2
    puts "Now we have #{@students.count} students"
    end
  elsif name.empty?
  puts "You haven't entered any students"
  else
  puts "please add next student's name, previous career and years of age"
    name = gets.chomp
    career = gets.chomp
    years = gets.chomp
  end
  end

def print_header
  puts "The students of this month's cohort at Makers Academy"
  puts "----------------"
end

def print_students_list
  if @students.count == 0
    puts "...No student entries"
  else
  @students.each_with_index do |student, index|
    puts "#{index +=1}. #{student[:name]} (#{student[:cohort]} cohort), previously worked as #{student[:prev_career]}, but decided to change to career in coding at the age of #{student[:years_old]}"
  end
 end
end

def print_footer # we print the total number of students here
unless @students.count == 0 then
  puts "Overall, we have #{@students.count} great students"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the student"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
   input_students
  when "2"
   show_students
  when "3"
   save_students
  when "4"
   load_students   
  when "9"
   exit #terminates program
  else
   puts "I didn't uderstand what you asked for, please try again."
  end
 end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end


def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:prev_career], student[:years_old]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort, career, years = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, prev_career: career, years_old: years}
  end
  file.close
end

interactive_menu
