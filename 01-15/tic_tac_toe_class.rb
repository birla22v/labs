require 'pry'
# Runs the basic game
class Game
  attr_reader :player1, :player2, :player1_token, :player2_token
  attr_accessor :b, :turn_count, :used

  WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
          [0, 4, 8], [2, 4, 6]]

  def initialize
    @b = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @used = []
    @turn_count = 0
    play_game
    play_again
  end

  def draw_ascii
    puts `clear`
    puts "\n\n\n\n\n        ______         _______           _______
       |__  __(_)     |__   __|         |__   __|
          | |  _  ___    | | __ _  ___     | | ___   ___
          | | | |/ __|   | |/ _` |/ __|    | |/ _ \\ / _ \\
          | | | | (__    | | (_| | (__     | | (_) |  __/
          |_| |_|\\___|   |_|\\__,_|\\___|    |_|\\___/ \\___|\n\n\n\n"
  end

  def prompt_player(message, prompt, validator)
    puts message
    input = gets.chomp
    until input =~ validator
      puts prompt
      input = gets.chomp
    end
    return input
  end

  def greeting
    draw_ascii
    choose_mode(prompt_player("Enter 1 to play human \nEnter 2 to play computer
Enter 3 to quit", "\nYou can only pick a number between 1 and 3! Try again",
 /^[123]$/))
  end

  def choose_mode(option)
    if option == '3'
      exit
    else
      print 'Enter player names: \nPlayer 1: '
      @player1 = HumanPlayer.new(gets.chomp)
      print option == '1' ? 'Player 2: ' : 'Player 2: Computer'
      @player2 = option == '1' ? HumanPlayer.new(gets.chomp) : ComputerPlayer.new('Computer')
    end
  end

  def choose_token
    @player1_token = rand(10) < 5 ? 'X' : 'O'
    @player2_token = @player1_token == 'X' ? 'O' : 'X'
  end

  def show_board
    puts "
     ______ ______ ______
    |      |      |      |
    |   #{@b[0]}  |   #{@b[1]}  |   #{@b[2]}  |
    |______|______|______|
    |      |      |      |
    |   #{@b[3]}  |   #{@b[4]}  |   #{@b[5]}  |
    |______|______|______|
    |      |      |      |
    |   #{@b[6]}  |   #{@b[7]}  |   #{@b[8]}  |
    |______|______|______|
    "
  end

  def winner?
    WINS.any? do |i, j, k|
      if @b[i] == @b[j] && @b[j] == @b[k]
        return @b[i]
      end
    end
  end

  def game_over
    b.all? { |x| x.is_a? String } || winner?
  end

  def print_game_stats
    winner = winner?
    if winner
      player = winner == @player1_token ? @player1 : @player2
      puts "#{player.player_name} won!"
    else
      puts 'It was a tie'
    end
  end

  def whose_turn
    player_x = @player1_token == 'X' ? @player1 : @player2
    player_o = player_x == @player1 ? @player2 : @player1
    player = turn_count.even ? player_x : player_o
    puts "#{player.player_name}'s turn. Choose an available number"
    num = player.take_turn(@used).to_i
    @used.push(num)
    @b[num - 1] = player == @player1 ? @player1_token : @player2_token
  end

  def play_game
    greeting
    choose_token
    show_board
    until game_over
      whose_turn
      show_board
      @turn_count += 1
    end
    print_game_stats
  end

  def play_again
    y_n = prompt_player('Would you like to play again? Hit y for yes or n for no
    ', 'You can only pick y or n! Try again', /^[yn]$/)
    y_n == 'y' ? Game.new : exit
  end

end

# The player class initializes player with a name
class Player
  attr_reader :player_name
  def initialize(player_name)
    @player_name = player_name
  end
end

# The HumanPlayer is a subclass of Player and defines take_turn
class HumanPlayer < Player
  def initialize(player_name)
    super
  end

  def take_turn(used)
    num_played = gets.chomp.to_i
    while used.include? num_played
      puts 'Choose an available number'
      num_played = gets.chomp.to_i
    end
    return num_played
  end
end

# The ComputerPlayer is a subclass of Player and defines take_turn
class ComputerPlayer < Player
  def initialize(player_name)
    super
  end

  def take_turn(used)
    num_played = rand(9) + 1
    while used.include? num_played
      num_played = rand(9) + 1
    end
    return num_played
  end
end
