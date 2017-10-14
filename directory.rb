@students = [] # an empty array accessible accross all methods.


def rand_month
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
  month = months[rand(months.length)]
end

def student_count
  if @students.count < 2
    puts "Now we have #{@students.count} student"
  else @students.count > 2
  puts "Now we have #{@students.count} students"
  end
end

def input_students
  puts "To input the students please enter the names, previous careers and years of age of the students "
  puts "To finish,just hit return three times"
  name = STDIN.gets.chomp
  career = STDIN.gets.chomp
  years = STDIN.gets.chomp.to_i
  if !name.empty?
    @students << {name: name, cohort: rand_month, prev_career: career, years_old: years}
    student_count
  else name.empty?
  puts "You haven't entered any students, please add next student's name, previous career and years of age"
    name = STDIN.gets.chomp
    career = STDIN.gets.chomp
    years = STDIN.gets.chomp.to_i
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
    puts "#{index +=1}. #{student[:name]} (#{student[:cohort]} cohort),"
    puts " previously worked as #{student[:prev_career]}, but decided to"
    puts "change to career in coding at the age of #{student[:years_old]}"
  end
 end
end

def print_footer # we print the total number of students here
unless @students.count == 0 then
  puts "Overall, we have #{@students.count} great students"
  end
end

def menu_options
  puts "Please choose what next you want to do and type in th enumber."
  puts "1. Input the students"
  puts "2. Show the student"
  puts "3. Save the list to students.csv"
  puts "4. Load the list of students from chosen file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1" then input_students
  when "2" then show_students
  when "3" then save_students
  when "4" then load_students
  when "9" then exit #terminates program
  else
   puts "I didn't uderstand what you asked for, please try again."
  end
 end

def interactive_menu
  loop do
    menu_options
    process(STDIN.gets.chomp)
  end
end


def save_students
  puts "Please write the name of the file you want to open"
  file_name = gets.chomp
  file = File.open(file_name, "w")
  @students.each do |student| # iterate over the array of students
    student_data = [student[:name], student[:cohort], student[:prev_career], student[:years_old]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  "Students saved!"
end

def load_students(filename = gets.chomp)
  file = File.open(filename, "r")
  puts "Reading students from the file provided"
  file.readlines.each do |line|
    name, rand_month, career, years = line.chomp.split(',')
    @students << {name: name, cohort: rand_month, prev_career: career, years_old: years}
 end
  file.close
end

def try_load_students
  filename = ARGV.first #first argument provided from the command line
  if filename.nil?
    puts "Loading the pre-set file..."
    file = File.open("students.csv")
    puts "Loaded #{@students.count} from student.csv " # if no filename is provided at all, back out of the method
  elsif File.exists?(filename) #if there is a filename provided as an argument and it exists
    puts "loading the #{filename} file..."
    file = File.open(filename)
    puts " Loaded #{@students.count} from #{filename}"
  else #if the filename provided doesn't exist..
    puts "Sorry, #{filename} you provided doesn't exist"
    exit #quit the program (or just the method in this case?...)
  end

end

try_load_students
interactive_menu
