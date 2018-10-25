require_relative '../config/environment'

# NEW USER-----------------------------------------
def dance
  block = proc { | response | response.read_body do | chunk | puts chunk end }
  RestClient::Request.execute(method: :get, url: 'parrot.live', block_response: block, headers: {'user-agent': '', 'content-type':'text'})
end
# ----------------------------------------------
def user_type
  puts `clear`

  # `afplay sounds/Button-beep-tone.mp3`

  # `afplay sounds/Goat-noise.mp3`

  login_banner
  user = $prompt.select("Are you a new user?", ["New User", "Existing User"])
  # puts "1. New User"
  # puts "2. Existing User"
  # user = gets.chomp.to_i
  puts `clear`
  if user == "New User"
    # puts "Type new username"
    newusername = $prompt.ask("Type new username")
    if !User.exists?(username: newusername) && newusername.length > 1
      realname = $prompt.ask("Type in REAL name:")
      temppass = $prompt.mask("Type new password: ")

      user_instance = User.create(username: newusername, name:realname, password:temppass)

      puts "New user #{newusername} created!"
      spinner = TTY::Spinner.new("Loading :spinner :spinner :spinner ", format: :spin_2)
      spinner.auto_spin
      sleep(1)
      spinner.stop('Done!')
      homepage(user_instance)
    else
      puts "Name already in use. Please choose another name."
      user_type
    end
  elsif user == "Existing User"
    login
  end
end

# LOGIN-------------------------------------------------
def login

  login_banner
  # puts "What is your USERNAME?"
  name = $prompt.ask("Enter your USERNAME:")
  if name == nil
    puts `clear`
    puts "Incorrect username. Please try again."
    login
  elsif name == "partyhard"
    t1 = Thread.new do
      dance
    end
    `afplay sounds/130503_tokyo_Drift__REMAKE_BABY.mp3`
    t1.join
  end
  # puts "What is your PASSWORD?"
  password = $prompt.mask("Enter your PASSWORD: ")
  if password == nil
    puts `clear`
    puts "Incorrect password. Please try again."
    login
  end
  validate(name,password)
end

def validate(name,password)
  if User.all.find_by(password:password) && User.find_by(username:name)
    spinner = TTY::Spinner.new("Loading :spinner :spinner :spinner ", format: :spin_2)
    spinner.auto_spin
    sleep(2)
    spinner.stop('Done!')
    # puts "Logging in... "
    # sleep(1)
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

  `afplay sounds/Button-beep-tone.mp3`

  #`afplay sounds/Goat-noise.mp3`

  homepage_banner
  # `say -v Alex "Welcome to JOURNALS #{user_instance.name}!"`
  `say -v Samantha "Hows your goat? #{user_instance.name}!!"`
  choose = $prompt.select("Choose an option", ["CREATE NOTES", "VIEW/EDIT NOTES", "SETTINGS", "LOGOUT", "QUIT"])
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
    user_instance.view_notes(user_instance)
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

  `afplay sounds/Button-beep-tone.mp3`


  settings_banner
  choose = $prompt.select("Choose an option", ["ADD SUBJECT", "GROUP FUNCTIONS", "CHANGE USERNAME", "CHANGE PASSWORD", "CLEAR ALL NOTES", "RETURN TO HOMEPAGE"])
#------------Cory add----- click events







#----------end click events Cory--------------
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
  elsif choose == "CLEAR ALL NOTES"
    delete_notes(user_instance)
  elsif choose == "ADD SUBJECT"
    add_subject(user_instance)
  elsif choose == "GROUP FUNCTIONS"
    group_functions(user_instance)
  elsif choose == "RETURN TO HOMEPAGE"
    homepage(user_instance)
  end
end

def add_group(user_instance)
  puts `clear`

  `afplay sounds/Button-beep-tone.mp3`

  # `afplay sounds/Goat-noise.mp3`

  addsubject_banner
  puts "**Enter [cancel] at any time to cancel**"
  ans = $prompt.ask("What group would you like to add?")
  if ans == "cancel"
    homepage(user_instance)
  end
  puts `clear`
  ans2 = $prompt.yes?("You entered '#{ans}' is this correct?")
  if ans2 == false
    homepage(user_instance)
  elsif ans2 == true
    new_group = Group.create(name: ans)
    puts "Group added: #{new_group.name}"
    $prompt.keypress("Press any key to return to main menu.")
    homepage(user_instance)

  end
end

# SETTINGS-----------------------------------------------------------
def group_functions(user_instance)
  puts `clear`

  `afplay sounds/Button-beep-tone.mp3`

  # `afplay sounds/Goat-noise.mp3`

  settings_banner
  choose = $prompt.select("Choose an option", ["ADD GROUP", "CHANGE GROUP", "RETURN TO HOMEPAGE"])
  if choose == "ADD GROUP"
    add_group(user_instance)
  elsif choose == "CHANGE GROUP"
    edit_group(user_instance)
  elsif choose == "RETURN TO HOMEPAGE"
    homepage(user_instance)
end


def edit_group(user_instance)
  puts `clear`

  `afplay sounds/Button-beep-tone.mp3`



  addsubject_banner
  ans = $prompt.ask("What group would you like to change too?")

  puts `clear`

  `afplay sounds/Button-beep-tone.mp3`


  addsubject_banner
  user_instance.group = ans
  puts "Group changed to: #{user_instance.group}"
  $prompt.keypress("Press any key to return to main menu.")
  homepage(user_instance)

  end
end
#SETTINGS-----------------------------------------

  def add_subject(user_instance)
    puts `clear`

    `afplay sounds/Button-beep-tone.mp3`

    addsubject_banner
    puts "**Enter [cancel] at any time to cancel**"
    ans = $prompt.ask("What subject would you like to add?")
    if ans == "cancel"
      homepage(user_instance)
    end
    puts `clear`
    ans2 = $prompt.yes?("You entered '#{ans}' is this correct?")
    if ans2 == false
      add_subject(user_instance)
    elsif ans2 == true
      new_subject = Subject.create(name: ans)
      puts "Subject added: #{new_subject.name}"
      $prompt.keypress("Press any key to return to main menu.")
      homepage(user_instance)

    elsif editchoice == "Delete"
      yahh = $prompt.yes?("ARE YOU SURE?")
      if yahh
        lala.destroy
        user_instance.notes.reload
        $prompt.keypress("DESTROYED! Press any key to return to your notes.")
        view_notes(user_instance)
      end

    end

  end

# SETTINGS-----------------------------------------------------------

def change_name(user_instance)
  puts `clear`

  `afplay sounds/Button-beep-tone.mp3`


  changename_banner
  puts "Please enter new username"
  name = gets.chomp.to_s
  user_instance.name = name
  puts "Your new username is #{name}"
  spinner = TTY::Spinner.new("Returning home :spinner :spinner :spinner ", format: :spin_2)
  spinner.auto_spin
  sleep(2)
  spinner.stop('Done!')
  homepage(user_instance)
end

# SETTINGS------------------------------------------------------------

def change_pass(user_instance)
  puts `clear`

  `afplay sounds/Button-beep-tone.mp3`

  # `afplay sounds/Goat-noise.mp3`

  changepass_banner
  puts "Please enter new password"
  pass = gets.chomp.to_s
  user_instance.password = pass
  puts "Your new password is #{'*' * pass.length}"
  # puts "Returning to homepage."
  spinner = TTY::Spinner.new("Returning to homepage :spinner :spinner :spinner ", format: :spin_2)
  spinner.auto_spin
  sleep(2)
  spinner.stop('Done!')
  sleep(2)
  homepage(user_instance)
end

# SETTINGS--------------------------------------------------------------

def delete_notes(user_instance)
  puts `clear`

`afplay sounds/Goat-noise.mp3`

  delete_banner
  `say -v Alex "WARNING! WARNING! WARNING!"`
  # puts "Please confirm you want to DELETE ALL your notes. This cannot be reversed."
  # puts "Yes / No"

  answer = $prompt.yes?("Please confirm you want to DELETE ALL your notes. This cannot be reversed.")
  if answer == true
    confirm = $prompt.ask("Are you sure? Enter [DELETE] if you are sure:")
    if confirm == "DELETE"
  # if confirm == "Yes"
      user_instance.notes.delete_all
      puts "All your notes have been deleted."
      # puts "Returning to homepage."
      spinner = TTY::Spinner.new("Returning to homepage :spinner :spinner :spinner ", format: :spin_2)
      spinner.auto_spin
      sleep(2)
      spinner.stop('Done!')
      sleep(2)
    else
      homepage(user_instance)
    end
  elsif answer == false
    homepage(user_instance)
  end
  homepage
end

# LOGOUT------------------------------------------------------

def logout
  puts `clear`

  `afplay sounds/Button-beep-tone.mp3`

  # `afplay sounds/Goat-noise.mp3`

  user_instance = nil
  logout_banner
  login
end

# QUIT--------------------------------------------------------

def quit
  puts `clear`
  `afplay sounds/Goat-sound-effect.mp3`
  goodbye_banner
  exit
end

# --------------------------------------------------------

# binding.pry
