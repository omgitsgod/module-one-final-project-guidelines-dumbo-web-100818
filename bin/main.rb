require_relative '../config/environment'
require_relative 'run.rb'
require_relative 'banner.rb'
require_relative 'title.rb'
# require_relative 'create_note.rb'

# puts `clear`
# puts "---------------------------------------------"
# puts "-                                           -"
# puts "-         Welcome to Class Journals         -"
# puts "-                                           -"
# puts "---------------------------------------------"
# binding.pry
title

def main
`afplay sounds/Goat-noise.mp3`
user_type
user_instance = login


end

main
