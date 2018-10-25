
def dance
  block = proc { | response | response.read_body do | chunk | puts chunk end }
  RestClient::Request.execute(method: :get, url: 'parrot.live', block_response: block, headers: {'user-agent': '', 'content-type':'text'})
end

def party_bird
  t1 = Thread.new do
    dance
  end
  `afplay sounds/130503_tokyo_Drift__REMAKE_BABY.mp3`
  t1.join
end

def bird_mode
  puts "Polly want to party???"
  `say -v Alex "Polly want to party?"`
  ans = $prompt.select("Polly want to party???", ["Yes!!!", "No..."])
  if ans == "Yes!!!"
    party_bird
  elsif ans == "No..."
    ans2 = $prompt.select("REALLY?? ARE YOU SURE?", ["Yeah...I'm lame..", "NO! I WANT TO PARTY WITH POLLY!!"])
    if ans2 == "Yeah...I'm lame.."
      puts "Well too bad WE ARE PARTYING WITH POLLYYYYYY!!!!!!!"
        party_bird
    elsif ans2 == "NO! I WANT TO PARTY WITH POLLY!!"
      puts "PARTY ON!!!"
      party_bird
    end
  end
end

def title
puts `clear`
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
puts'                       /$$$$$$   /$$$$$$   /$$$$$$  /$$$$$$$$          /$$$$$                                                   /$$          '
puts'                      /$$__  $$ /$$__  $$ /$$__  $$|__  $$__/         |__  $$                                                  | $$          '
puts'                     | $$  \__/| $$  \ $$| $$  \ $$   | $$               | $$  /$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$   /$$$$$$ | $$  /$$$$$$$'
puts'                     | $$ /$$$$| $$  | $$| $$$$$$$$   | $$               | $$ /$$__  $$| $$  | $$ /$$__  $$| $$__  $$ |____  $$| $$ /$$_____/'
puts'                     | $$|_  $$| $$  | $$| $$__  $$   | $$          /$$  | $$| $$  \ $$| $$  | $$| $$  \__/| $$  \ $$  /$$$$$$$| $$|  $$$$$$ '
puts'                     | $$  \ $$| $$  | $$| $$  | $$   | $$         | $$  | $$| $$  | $$| $$  | $$| $$      | $$  | $$ /$$__  $$| $$ \____  $$'
puts'                     |  $$$$$$/|  $$$$$$/| $$  | $$   | $$         |  $$$$$$/|  $$$$$$/|  $$$$$$/| $$      | $$  | $$|  $$$$$$$| $$ /$$$$$$$/'
puts'                      \______/  \______/ |__/  |__/   |__/          \______/  \______/  \______/ |__/      |__/  |__/ \_______/|__/|_______/ '


  prompt =

  `afplay sounds/Goat-noise.mp3`
  puts""

  y = $prompt.keypress("PRESS ANY KEY TO BEGIN")
  if y == "\u007F"
    x = $prompt.keypress("No, not that key... Try something else....")
      if x == "y"
        z = $prompt.keypress("WHAT DO YOU THINK YOURE DOING?!")
          if z == "\r"
          puts "OH SNAP"
          sleep(2)
          modmode
          end
      end
  elsif y == "g"
    `afplay sounds/Goat-sound-effect.mp3`
  elsif y == "!"
    bird_mode
    # t1 = Thread.new do
    #   dance
    # end
    # `afplay sounds/130503_tokyo_Drift__REMAKE_BABY.mp3`
    # t1.join
  end

end
