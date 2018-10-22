require_relative '../config/environment'


puts "---------------------------------------------"
puts "-                                           -"
puts "-          Welcome to Class Journals        -"
puts "-                                           -"
puts "---------------------------------------------"

# puts "1. Existing User"
# puts "2. New User"
#
# option = gets.chomp
# brian = User.create(name: "Brian", password: "123")
puts "What is your name?"
name = gets.chomp

def check_name(name)
  user_object = User.all.find_by(name: name)
  # condition = true
  unless user_object
    puts "Sorry, couldn't find your name. Please try again."
    name = gets.chomp
    user_object = User.all.find_by(name: name)

  end
  puts "What is your password?"
  password = gets.chomp
  check_password(password, user_object)
end

def check_password(password, user_object)
  pass = user_object.password == password
  unless pass
    puts "Sorry, wrong password. Please try again."
    password = gets.chomp
    pass = user_object.password == password
  end
  puts "Congratulations!"
end

check_name(name)

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
