require_relative '../config/environment'

class User
@@all = ["Brian", "Cory", "Ryan"]

def self.all
  @@all
end
end

puts "---------------------------------------------"
puts "-                                           -"
puts "-          Welcome to Class Journals        -"
puts "-                                           -"
puts "---------------------------------------------"

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
end
check_name(name)
# check_name(name)

puts "What is you password?"
password = gets.chomp

binding.pry
puts "hello"
