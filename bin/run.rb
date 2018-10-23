require_relative '../config/environment'

# NEW USER-----------------------------------------

def user_type
  user = $prompt.select("Are you a new user?", ["New User", "Existing User"])
  # puts "1. New User"
  # puts "2. Existing User"
  # user = gets.chomp.to_i
  puts `clear`
  if user == "New User"
    # puts "Type new username"
    newusername = $prompt.ask("Type new username")
    # puts "Type in REAL name:"
    realname = $prompt.ask("Type in REAL name:")
    # puts "Type new password"
    temppass = $prompt.mask("Type new password: ")

    User.create(username: newusername, name:realname, password:temppass)

    puts "New user #{newusername} created!"
    sleep(1)
  elsif user == "Existing User"
    puts ""
    puts ""
  else
    user_type
  end
end

# LOGIN-------------------------------------------------
def login
  login_banner
  # puts "What is your USERNAME?"
  name = $prompt.ask("Enter your USERNAME:")
  # puts "What is your PASSWORD?"
  password = $prompt.mask("Enter your PASSWORD: ")
  validate(name,password)
end

def validate(name,password)
  if User.all.find_by(password:password) && User.find_by(username:name)
    puts "Logging in... "
    sleep(1)
    user_instance = User.all.find_by(username: name)
    homepage(user_instance)
  else
    puts "Please try again."
    puts "------------------------------------------"
    login
  end
end

# HOMEPAGE-----------------------------------------------------
def homepage(user_instance)
  puts `clear`
  homepage_banner
  # `say -v Alex "Welcome to JOURNALS #{user_instance.name}!"`
  `say -v Samantha "Choose if you know whats good for you #{user_instance.name}!!"`
  choose = $prompt.select("Choose an option (1-5)", ["CREATE NOTES", "VIEW/EDIT NOTES", "SETTINGS", "LOGOUT", "QUIT"])
  # puts "Please choose an options. (1 - 5)"
  # puts "1 CREATE NOTES"
  # puts "2 VIEW/EDIT NOTES"
  # puts "3 SETTINGS"
  # puts "4 LOGOUT"
  # puts "5 QUIT"
  # choose = gets.chomp.to_i
  if choose == "CREATE NOTES"
    user_instance.create_a_note(user_instance)
  elsif choose == "VIEW/EDIT NOTES"
    puts "not here"
  elsif choose == "SETTINGS"
    settings(user_instance)
  elsif choose == "LOGOUT"
    logout
  elsif choose == "QUIT"
    quit
  else
    puts "Invalid input. Please try again"
  end
  homepage(user_instance)
end

# SETTINGS-------------------------------------------------------

def settings(user_instance)
  puts `clear`
  settings_banner
  choose = $prompt.select("Choose an option (1 - 4)", ["CHANGE USERNAME", "CHANGE PASSWORD", "CLEAR NOTES", "RETURN TO HOMEPAGE"])
  # puts "Please choose an options. (1 - 3)"
  # puts "1 CHANGE USERNAME"
  # puts "2 CHANGE PASSWORD"
  # puts "3 CLEAR NOTES"
  # puts "4 RETURN TO HOMEPAGE"
  # choose = gets.chomp.to_i
  if choose == "CHANGE USERNAME"
    change_name(user_instance)
  elsif choose == "CHANGE PASSWORD"
    change_pass(user_instance)
  elsif choose == "CLEAR NOTES"
    delete_notes
  elsif choose == "RETURN TO HOMEPAGE"
    homepage(user_instance)
  end
end

# SETTINGS-----------------------------------------------------------

def change_name(user_instance)
  puts `clear`
  changename_banner
  puts "Please enter new username"
  name = gets.chomp.to_s
  user_instance.name = name
  puts "Your new username is #{name}"
  sleep(2)
  homepage(user_instance)
end

# SETTINGS------------------------------------------------------------

def change_pass(user_instance)
  puts `clear`
  changepass_banner
  puts "Please enter new password"
  pass = gets.chomp.to_s
  user_instance.password = pass
  puts "Your new password is #{'*' * pass.length}"
  puts "Returning to homepage."
  sleep(2)
  homepage(user_instance)
end

# SETTINGS--------------------------------------------------------------

def delete_notes(user_instance)
  puts `clear`
  delete_banner
  `say -v Alex "WARNING! WARNING! WARNING!"`
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
  puts `clear`
  user_instance = nil
  logout_banner
  login
end

# QUIT--------------------------------------------------------

def quit
  puts `clear`
  goodbye_banner
  exit
end

# --------------------------------------------------------

# binding.pry
