require_relative '../config/environment'

# LOGIN-------------------------------------------------
def login
  puts "What is your name?"
  name = gets.chomp
  puts "What is your password?"
  password = gets.chomp
  validate(name,password)
end

def validate(name,password)
  if User.all.find_by(password:password) && User.find_by(name:name)
    puts "Logging in... "
    sleep(1)
    User.all.find_by(name: name)
  else
    puts "Please try again."
    puts "------------------------------------------"
    login
  end
end

# HOMEPAGE-----------------------------------------------------
def homepage
  puts "Welcome to JOURNALS!"
  puts "Please choose an options. (1 - 5)"
  puts "1 CREATE NOTES"
  puts "2 VIEW/EDIT NOTES"
  puts "3 SETTINGS"
  puts "4 LOGOUT"
  puts "5 QUIT"
  choose = gets.chomp.to_i
  if choose == 1
    create_a_note
  elsif choose == 2
    puts "not here"
  elsif choose == 3
    settings
  elsif choose == 4
    logout
  elsif choose == 5
    quit
  else
    puts "Invalid input. Please try again"
    homepage
  end
end

# SETTINGS-------------------------------------------------------

def settings
  puts "Please choose an options. (1 - 3)"
  puts "1 CHANGE USERNAME"
  puts "2 CHANGE PASSWORD"
  puts "3 CLEAR NOTES"
  puts "4 RETURN TO HOMEPAGE"
  choose = gets.chomp.to_i
  if choose == 1
    change_name
  elsif choose == 2
    change_pass
  elsif choose == 3
    delete_notes
  elsif choose == 4
    homepage
  end
end

# SETTINGS-----------------------------------------------------------

def change_name(user_instance)
  puts "Please enter new username"
  name = gets.chomp.to_s
  user_instance.name = name
  puts "Your new username is #{name}"
  sleep(2)
  homepage
end

# SETTINGS------------------------------------------------------------

def change_pass(user_instance)
  puts "Please enter new password"
  pass = gets.chomp.to_s
  user_instance.password = pass
  puts "Your new password is #{'*' * pass.length}"
  puts "Returning to homepage."
  sleep(2)
  homepage
end

# SETTINGS--------------------------------------------------------------

def delete_notes(user_instance)
  puts "Please confirm you want to DELETE ALL your notes. This cannot be reversed."
  puts "Yes / No"
  confirm = gets.chomp
  if confirm == "Yes"
    user_instance.notes.delete_all
    puts "All your notes have been deleted."
    puts "Returning to homepage."
    sleep(2)
  else
    delete_notes(user_instance)
  end
  homepage
end

# LOGOUT------------------------------------------------------

def logout
  user_instance = nil
  puts "You have been logged out."
  login
end

# QUIT--------------------------------------------------------

def quit
  puts "Goodbye"
  return
end

# --------------------------------------------------------

# binding.pry
puts "hello"
