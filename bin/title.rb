

def title
puts'                       /$$      /$$           /$$                                                     /$$               '
puts'                      | $$  /$ | $$          | $$                                                    | $$               '
puts'                      | $$ /$$$| $$  /$$$$$$ | $$  /$$$$$$$  /$$$$$$  /$$$$$$/$$$$   /$$$$$$        /$$$$$$    /$$$$$$  '
puts'                      | $$/$$ $$ $$ /$$__  $$| $$ /$$_____/ /$$__  $$| $$_  $$_  $$ /$$__  $$      |_  $$_/   /$$__  $$ '
puts'                      | $$$$_  $$$$| $$$$$$$$| $$| $$      | $$  \ $$| $$ \ $$ \ $$| $$$$$$$$        | $$    | $$  \ $$ '
puts'                      | $$$/ \  $$$| $$_____/| $$| $$      | $$  | $$| $$ | $$ | $$| $$_____/        | $$ /$$| $$  | $$ '
puts'                      | $$/   \  $$|  $$$$$$$| $$|  $$$$$$$|  $$$$$$/| $$ | $$ | $$|  $$$$$$$        |  $$$$/|  $$$$$$/ '
puts'                      |__/     \__/ \_______/|__/ \_______/ \______/ |__/ |__/ |__/ \_______/         \___/   \______/  '
puts'                     '
puts'                     '
puts'                      /$$$$$$   /$$$$$$   /$$$$$$  /$$$$$$$$          /$$$$$                                                   /$$          '
puts'                     /$$__  $$ /$$__  $$ /$$__  $$|__  $$__/         |__  $$                                                  | $$          '
puts'                     | $$  \__/| $$  \ $$| $$  \ $$   | $$               | $$  /$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$   /$$$$$$ | $$  /$$$$$$$'
puts'                     | $$ /$$$$| $$  | $$| $$$$$$$$   | $$               | $$ /$$__  $$| $$  | $$ /$$__  $$| $$__  $$ |____  $$| $$ /$$_____/'
puts'                     | $$|_  $$| $$  | $$| $$__  $$   | $$          /$$  | $$| $$  \ $$| $$  | $$| $$  \__/| $$  \ $$  /$$$$$$$| $$|  $$$$$$ '
puts'                     | $$  \ $$| $$  | $$| $$  | $$   | $$         | $$  | $$| $$  | $$| $$  | $$| $$      | $$  | $$ /$$__  $$| $$ \____  $$'
puts'                     |  $$$$$$/|  $$$$$$/| $$  | $$   | $$         |  $$$$$$/|  $$$$$$/|  $$$$$$/| $$      | $$  | $$|  $$$$$$$| $$ /$$$$$$$/'
puts'                      \______/  \______/ |__/  |__/   |__/          \______/  \______/  \______/ |__/      |__/  |__/ \_______/|__/|_______/ '




prompt =

sleep(3)




y = $prompt.keypress("PRESS ANY KEY TO BEGIN")
  if y == "\u007F"
    x = $prompt.keypress("No, not that key... Try something else....")
      if x == "y"
        z = $prompt.keypress("WHAT DO YOU THINK YOURE DOING?!")
        if z == "\r"
          puts "OH SNAP"
          sleep(2)
        end
      end
    elsif y == "b"
      `afplay sounds/Goat-sound-effect.mp3`
    end

end
