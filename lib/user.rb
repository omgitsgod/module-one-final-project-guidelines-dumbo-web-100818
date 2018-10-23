require 'pry'
class User < ActiveRecord::Base
has_many :notes
belongs_to :groups
has_many :subjects, through: :notes
<<<<<<< HEAD
=======


def create_a_note
puts "Choose from subjects"

Subject.create(name: "math")

Subject.all.each_with_index do |subject, index|
  puts "#{index + 1}: #{subject.name}"
end

subjecttemp = gets.chomp

y = Subject.all.map do |x|
  x.name
>>>>>>> 77f0ef6b190be7367958d918a1aed10c9e75826e
end

<<<<<<< HEAD
=======
if y.include?(subjecttemp)
subject = Subject.all.find_by(name: subjecttemp)
subject = subject
  puts "Rating?"
  rating = gets.chomp.to_i
  puts "Bookmark?"
  puts "True/False"
  bookmark = gets.chomp

  case bookmark
    when "true", "True", "yes", "Yes"
      bookmark = true
    when "false", "False", "no", "No"
      bookmark = false
  end
    new_note = Note.create(user: self, subject: subject, rating: rating, bookmark: bookmark )
    self.notes << new_note
else
  puts "Please try again"
    self.create_a_note
  end
end
>>>>>>> 87a1a15e7165e8b53cc51f7826456f194eb5fa35

# def create_a_note
# puts "Choose from subjects"
#
# Subject.create(name: "math", id: 1)
#
# binding.pry
# Subject.all.subjects.each_with_index do |subject, index|
#  puts "#{index + 1}: #{subject.name}"
# end
#
# subjecttemp = gets.chomp
#
# y = Subject.all.map do |x|
#   x.name
# end
#
# if y.include?(subjecttemp)
# subject = self.subjects.find_by(name: subjecttemp)
# subject = subjecttemp
#   puts "Rating?"
#   rating = gets.chomp
#   puts "Bookmark?"
#   puts "1. Yes"
#   puts "2. No"
#   bookmarktemp = gets.chomp
#     if bookmarktemp == 1
#       bookmark = true
#     elsif bookmarktemp == 2
#       bookmark = false
#     end
#     new_note = Note.create(user: self, subject: subject, rating: rating, bookmark: bookmark )
#     new_note << self.notes
# else
#   puts "Please try again"
#     self.create_a_note
#   end
# end
#
# end
