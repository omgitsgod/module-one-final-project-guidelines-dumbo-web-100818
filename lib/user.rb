require 'pry'
class User < ActiveRecord::Base
has_many :notes
belongs_to :groups
has_many :subjects, through: :notes

def create_a_note(user_instance)
puts `clear`
create_banner
puts "Choose from subjects"

Subject.create(name: "math")
Subject.all.each_with_index do |subject, index|
  puts "#{index + 1}: #{subject.name}"
end

subjecttemp = gets.chomp

y = Subject.all.map do |x|
  x.name
end

if y.include?(subjecttemp)
subject = Subject.all.find_by(name: subjecttemp)
subject = subject
  puts "Rating?"
  rating = gets.chomp.to_i
  puts "Message?"
  content = gets.chomp
  puts "Bookmark?"
  puts "True/False"
  bookmark = gets.chomp

  case bookmark
    when "true", "True", "yes", "Yes"
      bookmark = true
    when "false", "False", "no", "No"
      bookmark = false
  end
    new_note = Note.create(user: self, subject: subject, content: content, rating: rating, bookmark: bookmark )
    self.notes << new_note
    puts "Your note has been saved"
    x = $prompt.select("Where to?", ["VIEW NOTE", "RETURN TO HOMEPAGE"])
    if x == "VIEW NOTE"
      puts new_note.subject.name
      puts new_note.rating
      puts new_note.content
      $prompt.keypress("Press any key to return to main menu.")
      homepage(user_instance)
    elsif x == "RETURN TO HOMEPAGE"
      homepage(user_instance)
    end
else
  puts "Please try again"
    self.create_a_note
  end
end

end
