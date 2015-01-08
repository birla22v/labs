## BEWARE THE SEMICOLON!

require 'pry'
require 'set'

words = ['angus',
         'onomatopeia',
         'mississippi',
         'cookies',
         'terminal',
         'illness',
         'communist',
         'dictator',
         'capitalist',
         'marxist',
         'darwinism']

def finished? (turns, guesses, answer)
  turns.zero? || answer.chars.all? { |l| guesses.include?(l) }
end

def greeting (answer)
  puts `clear`
  puts"





           _   _                                   _   _
          | | | |                                 | \\ | |
          | |_| | __ _ _ __   __ _ _ __ ___   __ _|  \\| |
          |  _  |/ _` | '_ \\ / _` | '_ ` _ \\ / _` | . ` |
          | | | | (_| | | | | (_| | | | | | | (_| | |\\  |
          \\_| |_/\\__,_|_| |_|\\__, |_| |_| |_|\\__,_\\_| \\_/
                              __/ |
                             |___/
  "
  puts "                         Enter p to play!"
  play = gets.chomp.downcase
  if play == "p"
    puts `clear`
    puts "Enter a letter to see if it's in the word"
  end
end

def display_guesses(guesses,answer)
  guesses = guesses.to_a.to_s
  puts "Guesses so far #{guesses}"
end

def display_guesses_crossout(guesses,answer)
 alphabet ="a b c d e f g h i j k l m n o p q r s t u v w x y z"
 display_string = ""
 guesses = guesses.to_a.to_s
 puts ""
 puts "Select one of the following letters:"
 puts ""
 alphabet.each_char do |i|
   if !guesses.include?(i)
     display_string+= i+ " "
   else
     if i.ord >=97 && i.ord <=122
       display_string+= "- "
     else
       display_string+= "  "
     end
    end
 end
 puts display_string
end

def prompt_player(guesses, turn_count, answer)
  draw_man(turn_count)
  puts "You have #{turn_count} tries left."
  display_guesses_crossout(guesses, answer)
  puts ""
  guess=gets.chomp.downcase
end

def print_game(guesses, answer)

  answer.each_char do |c|
    if guesses.include?(c)
      print c+" "
    else
      print '_ '
    end
  end

end


def draw_man(turns)
  puts""
  if (turns == 6)
    puts "

      _______
    |/      |
    |
    |
    |
    |
    |
   _|___

   "
  elsif(turns == 5)
    puts "

      _______
    |/      |
    |      (_)
    |
    |
    |
    |
   _|___

   "
  elsif(turns == 4)
    puts "

      _______
    |/      |
    |      (_)
    |       |
    |       |
    |
    |
   _|___

   "
  elsif(turns == 3)
    puts "

      _______
    |/      |
    |      (_)
    |      \\|
    |       |
    |
    |
   _|___

    "
  elsif(turns == 2)
    puts "

      _______
    |/      |
    |      (_)
    |      \\|/
    |       |
    |
    |
   _|___

   "
  elsif(turns == 1)
    puts "

      _______
    |/      |
    |      (_)
    |      \\|/
    |       |
    |      /
    |
   _|___

   "
  end
end

def game_over(guesses, answer, words, turns)
  puts `clear`
  if answer.chars.all? { |l| guesses.include?(l)}
    puts "You won!!!"
    print_game(guesses, answer)
    draw_man(turns)
  else
    puts "Hanged!! The answer was #{answer}."
    puts "

    _______
    |/      |
    |      (_)
    |      \\|/
    |       |
    |      / \\
    |
   _|___

    "
  end
end

def hangman(words)
  turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
  guessed = Set.new
  answer = words.sample(1)[0]
  greeting(answer)
  print_game(guessed, answer)
  until finished?(turn_count, guessed, answer)

    guess = prompt_player(guessed, (turn_count), answer)
    turn_count -= 1 unless guessed.include?(guess) || answer.include?(guess)
    guessed.add(guess)
    puts `clear`
    puts "Enter a letter to see if it's in the word"
    print_game(guessed, answer)
  end
  game_over(guessed, answer, words, turn_count)
end

hangman(words)

times_played = 0

while times_played == 0 do
  puts "Play again? Enter y for yes and n for no"
  play_again = gets.chomp.downcase

  if (play_again == "y")
    hangman(words)
  else
    break
  end
end
