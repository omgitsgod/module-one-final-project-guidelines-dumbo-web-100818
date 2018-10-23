class User < ActiveRecord::Base
has_many :notes
belongs_to :groups
has_many :subjects, through: :notes

  def check_name(name)
    user_object = User.all.find_by(name: name)
    while false
      puts "Sorry, couldn't find your name. Please try again."
      name = gets.chomp
      user_object = User.all.find_by(name: name)
    end
  end

#   puts "What is your password #{name}?"
#   check_password(password)
#
#
#
#
# def check_password
#   while false
#     password = gets.chomp
#     user_object.find_by(password: password)
#     puts "Wrong password, try again?"
#   end
# end


end
