puts "---------------------------------------------"
puts "-                                           -"
puts "-             Create A note                 -"
puts "-                                           -"
puts "---------------------------------------------"

def create_a_note
puts "Choose from subjects"

self.subjects.each_with_index do |subject, index|
  puts "#{index + 1}: #{subject.name}"
end

answer = gets.chomp

  puts "Subject?"
  subjecttemp = gets.chomp
  subject = self.subjects.find_by(name: subjecttemp)
  puts "Rating?"
  rating = gets.chomp
  puts "Bookmark?"
  puts "1. Yes"
  puts "2. No"
  bookmarktemp = gets.chomp
    if bookmarktemp == 1
      bookmark = true
    elsif bookmarktemp == 2
      bookmark = false
    end
    new_note = Note.create(user: self, subject: subject, rating: rating, bookmark: bookmark )
    new_note << self.notes
else
  puts "Please try again"
    create_a_note
  end
end
