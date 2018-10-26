require_relative '../config/environment'

# fork{ exec 'afplay', 'music/jjjj.mp3'}
# NEW USER-----------------------------------------
def dance
  block = proc { | response | response.read_body do | chunk | puts chunk end }
  RestClient::Request.execute(method: :get, url: 'parrot.live', block_response: block, headers: {'user-agent': '', 'content-type':'text'})

end
# ----------------------------------------------
def user_type
  puts `clear`



  login_banner
  user = $prompt.select("Are you a new user?", ["New User", "Existing User"])
  if user == "New User"
    # puts "Type new username"
    newusername = $prompt.ask("Type new username")
    if !User.exists?(username: newusername) && newusername.length > 0
      realname = $prompt.ask("Type in REAL name:")
      temppass = $prompt.mask("Type new password: ")
    # find group ++++++++++++++++++++++++++++++++++++++++++++++
      arr = []
      Group.all.each do |group|
        arr << ["ID: #{group.id} Name: #{group.name}"]
      end

      grouptemp = $prompt.select("Choose your group: ", arr)
      idnum = grouptemp.split[1].to_i

      lalala = Group.all.find(idnum)

    # ++++++++++++++++++++++++++++++++++++++++++++++
      user_instance = User.create(username: newusername, name:realname, password:temppass, group: lalala)
      puts `clear`
      puts "New user -#{newusername}- created!"
      spinner = TTY::Spinner.new("Loading :spinner :spinner :spinner ", format: :spin_2)
      spinner.auto_spin
      sleep(1)
      spinner.stop('Done!')
      homepage(user_instance)
    else
      puts "Name already in use. Please choose another name."
      $prompt.keypress("Press any key to return to main menu.")
      user_type
    end
  elsif user == "Existing User"
    login
  end
end
# LOGIN-------------------------------------------------
def login
  puts `clear`
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
    `afplay sounds/ghostbusters_theme_song_hd.mp3`
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


  `afplay sounds/beeping.mp3`

  homepage_banner
  # `say -v Alex "Welcome to JOURNALS #{user_instance.name}!"`
  `say -v Samantha "How is your GOAT #{user_instance.name}!!"`
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

  `afplay sounds/beeping.mp3`


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

  `afplay sounds/beeping.mp3`

  # `afplay sounds/Goat-noise.mp3`

  addgroup_banner
  puts "**Enter [cancel] at any time to cancel**"
  ans = $prompt.ask("What group would you like to add?")
  if ans == "cancel"
    homepage(user_instance)
  elsif ans != nil && ans != "cancel"
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
  else
    puts "Invalid input"
    $prompt.keypress("Press any key to continue.")
    add_group(user_instance)
  end
end

# SETTINGS-----------------------------------------------------------
def group_functions(user_instance)
  puts `clear`

  `afplay sounds/beeping.mp3`

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

  `afplay sounds/beeping.mp3`



  addsubject_banner
  ans = $prompt.ask("What group would you like to change too?")

  puts `clear`

  `afplay sounds/beeping.mp3.mp3`


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

    `afplay sounds/beeping.mp3.mp3`

    addsubject_banner
    puts "**Enter [cancel] at any time to cancel**"
    ans = $prompt.ask("What subject would you like to add?")
    if ans == "cancel"
      homepage(user_instance)
    elsif !Subject.exists?(name: ans) && ans != nil && ans != "cancel"
      puts `clear`
      ans2 = $prompt.yes?("You entered '#{ans}' is this correct?")
      if ans2 == false
        add_subject(user_instance)
      elsif ans2 == true
        new_subject = Subject.create(name: ans)
        puts "Subject added: " + "#{new_subject.name}".colorize(:green)
        $prompt.keypress("Press any key to return to main menu.")
        homepage(user_instance)
      end
    else
      puts "ERROR: SUBJECT must not already exist and must not be blank."
      $prompt.keypress("Press any key to return to main menu.")
      homepage(user_instance)
    end
  end

  #     elsif editchoice == "Delete"
  #       yahh = $prompt.yes?("ARE YOU SURE?")
  #       if yahh
  #         lala.destroy
  #         user_instance.notes.reload
  #         $prompt.keypress("DESTROYED! Press any key to return to your notes.")
  #         view_notes(user_instance)
  #     end
  #
  #   end
  #
  # end

# SETTINGS-----------------------------------------------------------

def change_name(user_instance)
  puts `clear`

  `afplay sounds/beeping.mp3.mp3`


  changename_banner
  name = $prompt.ask("Please enter new password")
  # puts "Please enter new username"
  # name = gets.chomp.to_s
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


  `afplay sounds/beeping.mp3`

  changepass_banner
  pass = $prompt.mask("Please enter new password")
  # puts "Please enter new password"
  # pass = gets.chomp.to_s
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
  delete_banner
  answer = $prompt.yes?("Please confirm you want to DELETE ALL your notes. THIS CANNOT BE REVERSED.")
  `say -v Alex "WARNING!"`
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

  `afplay sounds/beeping.mp3`

  # `afplay sounds/beeping.mp3`

  # user_instance = nil
  logout_banner
  $prompt.keypress("Press any key to return to login page.")
  login
end

# QUIT--------------------------------------------------------

def quit
  puts `clear`
  goodbye_banner
  `afplay sounds/Goat-sound-effect.mp3`
  exit
end

# MOD MODE--------------------------------------------------------

def modmode
  puts `clear`
  mod_banner
  arr = []
       Group.all.each do |group|
         arr << ["ID: #{group.id} Name: #{group.name}"]
       end

       grouptemp = $prompt.select("Choose your group: ", arr)
       idnum = grouptemp.split[1].to_i

       lalala = Group.all.find(idnum)

       puts `clear`
       mod_banner
       choose = $prompt.select("Choose an option", ["DATA", "VIEW/CHANGE GROUP", "RETURN TO HOMEPAGE"])
       if choose == "DATA"
         choose2 = $prompt.select("Choose an option", ["USER NOTES",{name: "AVERAGE RATING FOR GROUP", disabled: "    Working on it!"}, {name: "GRAPH OF AVERAGE RATING", disabled: "    Working on it!"}, "MAIN MENU"])
         if choose2 == "MAIN MENU"
           modmode
         elsif choose2 == "AVERAGE RATING FOR GROUP"
         elsif choose2 == "GRAPH OF AVERAGE RATING"
         elsif choose2 == "USER NOTES"
           if lalala.notes.length > 0
             puts `clear`
             `afplay sounds/beeping.mp3`
             viewnotes_banner
             yar = []
           lalala.notes.each do |note|

           yar << [note.subject.name, note.rating, note.content, note.bookmark]
           end
           table = TTY::Table.new ["Subject", "Rating", "Message", "Bookmark"], yar

           puts table.render(:ascii)
           $prompt.keypress("Press any key to continue")
           modmode
           else
             puts "No SHOT"
             $prompt.keypress("Press any key to continue")
             modmode
           end
         end
       elsif choose == "VIEW/CHANGE GROUP"
         choose2 = $prompt.select("Choose an option", ["VIEW USERS", "CREATE NEW USER", "MAIN MENU"])
         if choose2 == "MAIN MENU"
           modmode
         elsif choose2 == "VIEW USERS"
            if lalala.users.length > 0
           arr = []
                lalala.users.each do |user|
                  arr << ["ID: #{user.id} Name: #{user.name}, Notes: #{user.notes.length}"]
                end

                usertemp = $prompt.select("Choose your user: ", arr)
                idnum = usertemp.split[1].to_i

                lalala = User.all.find(idnum)

                choose3 = $prompt.select("Choose an option", ["DELETE ALL USERS", "DELETE USER", "MAIN MENU"])

                if choose3 == "DELETE ALL USERS"
                 choose4 = $prompt.yes?("ARE YOU SURE?")
                 if choose4
                   choose5 = $prompt.yes?("REALLY REALLY REALLY SURE?")
                   if choose5
                   lalala.users.delete_all
                   modmode
                 end
                else
                  modmode
               end
             elsif choose3 == "DELETE USER"
               choose4 = $prompt.yes?("ARE YOU SURE?")
               if choose4
                lalala.destroy
                User.all.reload
                puts "USER DELETED"
                $prompt.keypress("PRESS ANY KEY TO CONTINUE")
                modmode
              else
                modmode
              end
               elsif choose3 == "MAIN MENU"
                 modmode
               end
             else
               puts "Your group is mighty lonely"
               $prompt.keypress("Press any key to continue")
               modmode
             end
         elsif choose2 == "CREATE NEW USER"
           newusername = $prompt.ask("Type new username")
           if !User.exists?(username: newusername) && newusername.length > 0
             realname = $prompt.ask("Type in REAL name:")
             temppass = $prompt.mask("Type new password: ")

             user_instance = User.create(username: newusername, name:realname, password:temppass, group: lalala)

             puts "New user #{newusername} created!"
             spinner = TTY::Spinner.new("Loading :spinner :spinner :spinner ", format: :spin_2)
             spinner.auto_spin
             sleep(1)
             spinner.stop('Done!')
             modmode
           else
             puts "Name already in use. Please choose another name."
             modmode
           end
         end
       elsif choose == "RETURN TO HOMEPAGE"
         title
       end

end
# binding.pry
