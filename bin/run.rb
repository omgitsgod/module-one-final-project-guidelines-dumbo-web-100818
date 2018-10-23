require_relative '../config/environment'


def try_again
  puts "What is your name?"
  name = gets.chomp
  puts "What is your password?"
  password = gets.chomp
  validate(name,password)
end
def validate(name,passwords)
  if User.all.find_by(password:passwords) && User.find_by(name:name).password

    puts "hello and welcome to your journal account!"
  else
    puts "Please try again."
    puts "------------------"
    try_again

  end
end
try_again

# def get_user
#   puts "What is your name?"
#   name = gets.chomp
#   user_object = check_name(name)
#   puts "What is your password?"
#   password = gets.chomp
#   check_password(password, user_object)
# end
#
#
# def check_name(name)
#   user_object = User.all.find_by(name: name)
#   # condition = true
#   while !user_object
#     puts "Sorry, couldn't find your name. Please try again."
#     name = gets.chomp
#     user_object = User.all.find_by(name: name)
#
#   end
#   # puts "What is your password?"
#   # password = gets.chomp
#   # check_password(password, user_object)
# end
#
# def check_password(password, user_object)
#   pass = password
#   if pass == user_object.password
#     puts "You are now logged in..."
#   else
#     while !pass
#       puts "Sorry, wrong password. Please try again."
#       password = gets.chomp
#       pass = user_object.password == password
#     end
#     puts "You are now logged in..."
# end


# "HOME"
# puts "What would you like to do?"
# puts "1. See notes"
# puts "2. New/Edit/Delete note"
# puts "3. Make a new subject"
# puts "4. Logout"

def logout
  puts "You have been logged out."
  return
end

def home(user_instance)
  puts "What would you like to do? Please enter number 1 - 5 for desired option."
  puts "1. See notes"
  puts "2. New/Edit/Delete note"
  puts "3. Make a new subject"
  puts "4. Logout"
  see_note(user_instance)



  while true
    puts "Invalid input, please try again. Please enter number 1 - 5 for desired option."
    puts "What would you like to do?"
    puts "1. See notes"
    puts "2. New/Edit/Delete note"
    puts "3. Make a new subject"
    puts "4. Logout"
    puts "Do something else? Provide input:"
    choose = gets.chomp
  end
end

def see_note(user_instance)
  choose = gets.chomp
  if choose == 1
    user_instance.notes.each do |note|
      puts note
    end
  elsif choose == 2
    manip_note
  elsif choose == 3
    new_sub == 4
    # Subject.create(NAME:)
  else
    logout
  end
end

def manip_note
"OPTION 1"
"See all notes" >> "Bookmark note"
"See all BOOKMARKED notes"
"See notes by subject"
"back"
end

def bookmarks
  Note.bookmarked
end

def see_note
  choose = gets.chomp
  if choose == 1

  elsif choose == 2
  end
end

# "OPTION 2"
# "1. New + Save note"
# "2. Edit note"
# "3. Delete note"
# "4. back"

def option2
  choose = gets.chomp
  if choose == 1
    Subject.create(:NAME).save
  elsif choose == 2
  elsif choose == 3
    id = gets.chomp
    User.find(id).destroy
  elsif choose == 4
  end
end

# "OPTION 3"
# puts "Please enter a new subject"
# puts "Please enter enter a comment for your new note in the subject #{subject}"
# "back"

# puts "What is your password?"
# password = gets.chomp
# def check_password(password, user_object)
#   binding.pry
#   pass = user_object.find_by(password: password)
#   unless pass
#     puts "Sorry, wrong password. Please try again."
#     password = gets.chomp
#     pass = user_object.find_by(password: password)
#   end
#   puts "Congratulations!"
# end
# check_password(password, holder)
# check_name(name)

# puts "What is your password?"
# password = gets.chomp

binding.pry
puts "hello"
