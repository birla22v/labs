
class Hangman
  attr_reader :turn_count, :wordList, :word, :guessed_letters

  def initialize(*wordList)
    @turn_count = 6
    @wordList = wordList
    @word = generate_word
    @guessed_letters = []
  end

  def generate_word
    (wordList.sample).sample
  end


  def take_turn(letter)
    if !@guessed_letter.include?(letter)
      guessed_letter<<letter
      if !@word.include(letter)
        @turn_count-=1
    end
  end

  def turns_left
    @turn_count
  end

  def to_s
    string = ""
    @word.each do |l|
      if @guessed_letters.include?(l)
        string += l+" "
      else
        string += "_ "
      end
    end
    string
  end

  def letters_left
    ('a'..'z').to_a - @guessed_letters
  end

  def game_over
    if word.chars.all? { |l| guessed_letters.include?(l)}
      puts "You won!"
    elsif !word.chars.all? { |l| guessed_letters.include?(l)} && @turn_count ==0
      puts "You lost"
    end
  end

end
