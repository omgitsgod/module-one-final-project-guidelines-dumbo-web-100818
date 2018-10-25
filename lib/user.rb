require 'pry'
class User < ActiveRecord::Base
  has_many :notes
  belongs_to :groups
  has_many :subjects, through: :notes

  def create_a_note(user_instance)
    arr = []
    puts `clear`
    create_banner
    # puts "Choose from subjects"
    Subject.all.each do |subject|
      arr << subject.name
    # Subject.all.each_with_index do |subject, index|
    #   puts "#{index + 1}: #{subject.name}"
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
      puts table.render(:unicode)
      $prompt.keypress("Press any key to return to main menu.")
      homepage(user_instance)

    else
      puts "Please try again"
      self.create_a_note
    end
  end

#-View Notes-----------------------
def view_notes(user_instance)
  puts `clear`
  `afplay sounds/Button-beep-tone.mp3`
  viewnotes_banner
  yar = []
user_instance.notes.each do |note|
<<<<<<< HEAD
#  puts "----------------------"
#  puts note.subject.name
#  puts note.rating
#  puts note.content
#  puts "----------------------"
=======

>>>>>>> 20ad2938a4f678953bc190728a303d9327af2b14
yar << [note.subject.name, note.rating, note.content, note.bookmark]
end
table = TTY::Table.new ["Subject", "Rating", "Message", "Bookmark"], yar

puts table.render(:ascii)
  #puts"(1). View by Subject"
  #puts"(2). View by Rating"
  #puts"(3). View by Bookmark"
  option = $prompt.select("What now?: ", ["Edit", "Sort by Subject", "Sort by Rating", "Sort by Bookmark", "Main Menu"])

  if option == "Sort by Subject"
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
  blooblooo.each do |x|
    hmm << [x.subject.name, x.rating, x.content, x.bookmark]
  end
  table2 = TTY::Table.new ["Subject", "Rating", "Message", "Bookmark"], hmm
  puts table2.render(:ascii)
  subchoice = $prompt.select("Where to? : ", ["Edit", "Main Menu"])

  ###########################
  if subchoice == "Edit"
    edit_note(user_instance)
    elsif subchoice == "Main Menu"
    homepage(user_instance)
  end
  ########################
  elsif
    option == "Sort by Rating"
    rating = $prompt.slider("Rating?", max:10, step: 1)
    x = user_instance.notes.where(rating: rating)

    hmm2 = []
    x.each do |note|
      hmm2 << [note.subject.name, note.rating, note.content, note.bookmark]
    end

    table3 = TTY::Table.new ["Subject", "Rating", "Message", "Bookmark"], hmm2
    puts table3.render(:unicode)
    subchoice = $prompt.select("Where to? : ", ["Edit", "Main Menu"])
    ###########################
    if subchoice == "Edit"
      edit_note(user_instance)
      elsif subchoice == "Main Menu"
      homepage(user_instance)
    end
    ########################
  elsif
    option == "Main Menu"
    homepage(user_instance)

  elsif
    option == "Edit"
    edit_note(user_instance)

  elsif
    option == "Sort by Bookmark"
    bookmark = $prompt.yes?("Is your note bookmarked?")
    x = user_instance.notes.where(bookmark: bookmark)

    hmm3 = []
    x.each do |note|
      hmm3 << [note.subject.name, note.rating, note.content, note.bookmark]
    end

    table4 = TTY::Table.new ["Subject", "Rating", "Message", "Bookmark"], hmm3
    puts table4.render(:unicode)
    subchoice = $prompt.select("Where to? : ", ["Edit", "Main Menu"])
    ###########################
    if subchoice == "Edit"
      edit_note(user_instance)
      elsif subchoice == "Main Menu"
      homepage(user_instance)
    end
    ########################
   end
 end

  def edit_note(user_instance)
    arr = []
    user_instance.notes.each do |note|
      arr << ["#{note.id} #{note.created_at}  #{note.subject.name}  #{note.rating}  #{note.content}"]
    end

    notetemp = $prompt.select("Choose your note: ", arr)
    idnum = notetemp.split[0].to_i

    lala = user_instance.notes.find(idnum)

    editchoice = $prompt.select("What now?: ", ["Edit Rating", "Edit Content", "Delete", "Main Menu"])

    ##########
    if editchoice == "Edit Rating"
      rat1 = $prompt.ask("Enter new rating (NUMBER): ")
      lala.rating = rat1
      lala.save
      user_instance.notes.reload
      $prompt.keypress("SAVED! Press any key to return to your notes.")
      view_notes(user_instance)
    elsif editchoice == "Edit Content"
      con1 = $prompt.ask("Enter new content: ")
      lala.content = con1
      lala.save
      user_instance.notes.reload
      $prompt.keypress("SAVED! Press any key to return to your notes.")
      view_notes(user_instance)
    elsif editchoice == "Delete"
      yahh = $prompt.yes?("ARE YOU SURE?")
      if yahh
        lala.destroy
        user_instance.notes.reload
        $prompt.keypress("DESTROYED! Press any key to return to your notes.")
        view_notes(user_instance)
      end

    elsif editchoice == "Main Menu"
      homepage(user_instance)
    end
    ##########
  

  end

end
