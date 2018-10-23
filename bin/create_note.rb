
puts "---------------------------------------------"
puts "-                                           -"
puts "-             Create A note                 -"
puts "-                                           -"
puts "---------------------------------------------"

user_instance = User.create(name: "Ryan")
user_instance.create_a_note
