require 'pry'
class User < ActiveRecord::Base
has_many :notes
belongs_to :groups
has_many :subjects, through: :notes

def create_a_note(user_instance)
  arr = []
puts `clear`
create_banner
#puts "Choose from subjects"

Subject.all.each do |subject|
  arr << subject.name
end

subjecttemp = $prompt.select("Choose your subject", arr)

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
  yar = []
user_instance.notes.each do |note|
#  puts "----------------------"
#  puts note.subject.name
#  puts note.rating
#  puts note.content
#  puts "----------------------"
yar << [note.subject.name, note.rating, note.content, note.bookmark]
end
table = TTY::Table.new ["Subject", "Rating", "Message", "Bookmark"], yar

puts table.render(:ascii)
  #puts"(1). View by Subject"
  #puts"(2). View by Rating"
  #puts"(3). View by Bookmark"
  option = $prompt.select("View by: ", ["Subject", "Rating", "Bookmark"])

  if option == "Subject"
    arr = []
    Subject.all.each do |subject|
      arr << subject.name
    end

    subjecttemp = $prompt.select("Choose your subject", arr)

    y = Subject.all.map do |x|
      x.name
    end

    if y.include?(subjecttemp)
    subject = Subject.all.find_by(name: subjecttemp)
  end
  ##############################


  hmm = []
  blooblooo = user_instance.notes.where(subject: subject)
  binding.pry
  blooblooo.each do |x|
    hmm << [x.subject.name, x.rating, x.content, x.bookmark]
  end
  table2 = TTY::Table.new ["Subject", "Rating", "Message", "Bookmark"], hmm
  puts table2.render(:ascii)
  subchoice = $prompt.select("Where to? : ", ["Edit", "Delete", "Main Menu"])

  ###########################
  if subchoice == "Edit"
    edit_note(user_instance)
    elsif subchoice == "Main Menu"
    homepage(user_instance)
  end
  ########################
  elsif
    option == "Rating"
    rating = $prompt.slider("Rating?", max:10, step: 1)
    x = user_instance.notes.where(rating: rating)

    hmm2 = []
    x.each do |note|
      hmm2 << [note.subject.name, note.rating, note.content, note.bookmark]
    end

    table3 = TTY::Table.new ["Subject", "Rating", "Message", "Bookmark"], hmm2
    puts table3.render(:ascii)
    subchoice = $prompt.select("Where to? : ", ["Edit", "Delete", "Main Menu"])
    ###########################
    if subchoice == "Main Menu"
      homepage(user_instance)
    end
    ########################



  elsif
    option == "Bookmark"
    bookmark = $prompt.yes?("Is your note bookmarked?")
    x = user_instance.notes.where(bookmark: bookmark)

    hmm3 = []
    x.each do |note|
      hmm3 << [note.subject.name, note.rating, note.content, note.bookmark]
    end

    table4 = TTY::Table.new ["Subject", "Rating", "Message", "Bookmark"], hmm3
    puts table4.render(:ascii)
    subchoice = $prompt.select("Where to? : ", ["Edit", "Delete", "Main Menu"])
    ###########################
    if subchoice == "Main Menu"
      homepage(user_instance)
    end
    ########################
   end
 end

  def edit_note(user_instance)
    arr = []
    user_instance.notes.each do |note|
      arr << ["Created: #{note.created_at}   #{note.subject.name}     Rating: #{note.rating}     Message: #{note.content}"]
    end

    notetemp = $prompt.select("Choose your note: ", arr)
    binding.pry


  end

end
