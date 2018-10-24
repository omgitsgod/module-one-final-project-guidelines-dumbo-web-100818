require 'pry'
class User < ActiveRecord::Base
has_many :notes
belongs_to :groups
has_many :subjects, through: :notes

def create_a_note(user_instance)
puts `clear`
create_banner
puts "Choose from subjects"

Subject.all.each_with_index do |subject, index|
 puts "#{index + 1}: #{subject.name}"
end

subjecttemp = gets.chomp

y = Subject.all.map do |x|
 x.name
end

if y.include?(subjecttemp)
subject = Subject.all.find_by(name: subjecttemp)

 rating = $prompt.slider("Rating?", max:10, step: 1)
 content = $prompt.ask("Message?")
 bookmark = $prompt.yes?("Bookmark?")

   new_note = Note.create(user: self, subject: subject, content: content, rating: rating, bookmark: bookmark )
   self.notes << new_note
table = TTY::Table.new ["Subject", "Rating", "Message"], [[new_note.subject.name, new_note.rating, new_note.content]]
puts table.render(:ascii)
     $prompt.keypress("Press any key to return to main menu.")
     homepage(user_instance)

else
 puts "Please try again"
   self.create_a_note
 end
end

#-View Notes-----------------------

def view_notes(user_instance)
user_instance.notes.each do |note|
  puts "----------------------"
  puts "                      "
  puts note.content
  puts "                      "
  puts "----------------------"
end
  puts"(1). View by Subject"
  puts"(2). View by Rating"
  puts"(3). View by Bookmark"
  option = gets.chomp.to_i
  if option == 1
    puts user_instance.subject
  elsif
    option == 2
    user_instance.notes.where(:rating => (1..5)).each_with_index do |note,index|
      puts"      Ranked notes  #{index + 1}      "
      puts note.content
      puts"--------------------------------------"
    end
  elsif
    option == 3
       user_instance.notes.where(:bookmark => true).each_with_index do |note,index|
      puts"      Bookmarked notes  #{index + 1}      "
      puts note.content
      puts"-------------------------------------------"
      # user_instance.notes.where(:bookmark => true)
end
   end
 end

end
