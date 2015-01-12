require 'set'

def greeting
  input = -1
  puts `clear`
  puts "\n\n\n\n\n"
  string = "
              ______         _______           _______
             |__  __(_)     |__   __|         |__   __|
                | |  _  ___    | | __ _  ___     | | ___   ___
                | | | |/ __|   | |/ _` |/ __|    | |/ _ \\ / _ \\
                | | | | (__    | | (_| | (__     | | (_) |  __/
                |_| |_|\\___|   |_|\\__,_|\\___|    |_|\\___/ \\___| "

  puts string + "\n\n\n\n"
  puts "Enter 1 for easy level"
  puts "Enter 2 for normal level"
  puts "Enter 3 for hard level"
  puts "Enter 4 for nightmare level"
  puts "Enter 5 to quit"
  input = gets.chomp.to_i
  while (input > 5) || (input < 1) do
    puts "Invalid input. Enter either 1,2,3, 4 or 5"
    input = gets.chomp.to_i
  end
  return input
end

def which_player_first

  random = rand(10)
  if random < 5
    player1 = 1
  else
    player1 = 0
  end
end

def is_there_a_winner?(used)
  if used[0] == used[1] && used[1] == used[2]
    return used[0]
  elsif used[3] == used[4] && used[4] == used[5]
    return used[3]
  elsif used[6] == used[7] && used[7] == used[8]
    return used[6]
  elsif used[0] == used[3] && used[3] == used[6]
    return used[0]
  elsif used[1] == used[4] && used[4] == used[7]
    return used[1]
  elsif used[2] == used[5] && used[5] == used[8]
    return used[2]
  elsif used[0] == used[4] && used[4] == used[8]
    return used[0]
  elsif used[2] == used[4] && used[4] == used[6]
    return used[2]
  else
  return "draw"
end
end

def game_over(used, first_player, sec_player)
  winner = is_there_a_winner?(used)
  if winner != "draw"
    if winner = "X"
      puts " #{first_player} wins!"
    elsif winner = "O"
      puts " #{sec_player} wins!"
    end
  end
end

def print_game_human(player1,player2)
  puts `clear`
  token = ""
  counter = 0
  game_round = 0
  used = ["1","2","3","4","5","6","7","8","9"]
  spots_taken = Set.new
  which_player = ""
  other_player = ""
  prev_token = ""
  winner = "draw"
  a1 = "1"
  a2 = "2"
  a3 = "3"
  a4 = "4"
  a5 = "5"
  a6 = "6"
  a7 = "7"
  a8 = "8"
  a9 = "9"
  board =
  "
   ______ ______ ______
  |      |      |      |
  |   #{a1}  |   #{a2}  |   #{a3}  |
  |______|______|______|
  |      |      |      |
  |   #{a4}  |   #{a5}  |   #{a6}  |
  |______|______|______|
  |      |      |      |
  |   #{a7}  |   #{a8}  |   #{a9}  |
  |______|______|______|
  "

  while game_round < 9


    if counter == 0
      token = "X"
      prev_token = "O"
      which_player = player1
      other_player = player2
      counter += 1
    else
      token = "O"
      prev_token = "X"
      which_player = player2
      other_player = player1
      counter -= 1
    end

    if game_round == 0
      puts "#{which_player}'s turn"
      puts board
      puts "\n Select one of the numbered boxes"
    end
    game_round += 1

    box_selected = gets.chomp.to_i
    while ((box_selected < 1) || (box_selected > 9) || spots_taken.include?(box_selected)) do
      puts "Invalid input. Enter one of the numbered boxes"
      box_selected = gets.chomp.to_i
    end
      spots_taken.add(box_selected)
      used[box_selected-1] = token

      updated_board=""

      board.each_char do |c|
        if c == box_selected.to_s
          updated_board += token
        else
          updated_board+=c
        end
      end

      board.replace updated_board
      puts `clear`
      puts "#{which_player}'s turn"
      puts board
      puts "\n Select one of the numbered boxes"

      winner = is_there_a_winner?(used)
      if (winner!= "draw")
        game_over(used, player1, player2)
        break
      end

      puts `clear`
      puts "#{other_player}'s turn"
      puts board
      puts "\n Select one of the numbered boxes"
  end

  if game_round == 9 && winner=="draw"
    puts "It was a tie!"
  end
end

def computer_turn(level, spots_taken, token)
  if level == "normal"
    number = rand(8)+1
    while spots_taken.include?(number) do
      number = rand(8)+1
    end
    return number

  elsif level == "hard"
    i = 0
    max = 8
    while i<max do
      next_move = []

      if spots_taken.include?(i)
       i+=1
      else
       next_move = spots_taken.add(i).to_a
       if is_there_a_winner?(next_move)!="draw"
         return i
       end
     end
    end
    number = rand(8)+1
    while spots_taken.include?(number) do
      number = rand(8)+1
    end
    return number

  elsif level == "nightmare"
    puts "Work in Progress"
  end

end

def print_game_computer(player1, player2, level)
  puts `clear`
  token = ""
  counter = 0
  game_round = 0
  used = ["1","2","3","4","5","6","7","8","9"]
  spots_taken = Set.new
  which_player = ""
  other_player = ""
  prev_token = ""
  winner = "draw"
  a1 = "1"
  a2 = "2"
  a3 = "3"
  a4 = "4"
  a5 = "5"
  a6 = "6"
  a7 = "7"
  a8 = "8"
  a9 = "9"
  board =
  "
   ______ ______ ______
  |      |      |      |
  |   #{a1}  |   #{a2}  |   #{a3}  |
  |______|______|______|
  |      |      |      |
  |   #{a4}  |   #{a5}  |   #{a6}  |
  |______|______|______|
  |      |      |      |
  |   #{a7}  |   #{a8}  |   #{a9}  |
  |______|______|______|
  "

  while game_round < 9

    winner = is_there_a_winner?(used)
    if (winner!= "draw")
      game_over(used, player1, player2)
      break
    end

    if counter == 0
      token = "X"
      prev_token = "O"
      which_player = player1
      other_player = player2
      counter += 1
    else
      token = "O"
      prev_token = "X"
      which_player = player2
      other_player = player1
      counter -= 1
    end

    if game_round == 0
      puts "#{which_player}'s turn"
      puts board
      puts "\n Select one of the numbered boxes"
    end
    game_round += 1

    if which_player != "Computer"
      box_selected = gets.chomp.to_i
        while ((box_selected < 1) || (box_selected > 9) || spots_taken.include?(box_selected)) do
            puts "Invalid input. Enter one of the numbered boxes"
            box_selected = gets.chomp.to_i
        end
     else
       box_selected=computer_turn(level, spots_taken, token)
     end
    spots_taken.add(box_selected)
    used[box_selected-1] = token

    updated_board=""

    board.each_char do |c|
      if c == box_selected.to_s
        updated_board += token
      else
        updated_board+=c
      end
    end

    board.replace updated_board

    puts `clear`
    puts "#{which_player}'s turn"
    puts board
    puts "\n Select one of the numbered boxes"

    winner = is_there_a_winner?(used)
    if (winner!= "draw")
      game_over(used, player1, player2)
      break
    end

    puts `clear`
    puts "#{other_player}'s turn"
    puts board
    puts "\n Select one of the numbered boxes"
  end
  if game_round == 9 && winner=="draw"
    puts "It was a tie!"
  end
end

def human_player
  first_player = which_player_first
  puts "Enter player names!"
  print "Player 1: "
  player1 = gets.chomp
  print "Player 2: "
  player2 = gets.chomp

  if first_player != 0
    print_game_human(player1,player2)
  else
    print_game_human(player2,player1)
  end

end

def computer_player(level)
  first_player = which_player_first
  puts "Enter player names!"
  puts "Player 1: Computer"
  player2 = "Computer"
  print "Player 2: "
  player1 = gets.chomp

  if first_player != 0
    print_game_computer(player1, player2,level)
  else
    print_game_computer(player2, player1,level)
  end


end

def play_easy_mode
  puts `clear`
  human_player
end

def play_normal_mode
  puts `clear`
  puts "Enter c to play the computer or o for another player"
  player2 = gets.chomp
  if player2 == "c"
    computer_player("normal")
  else
    human_player
  end

end

def play_hard_mode
  puts `clear`
  computer_player("hard")
end

def play_nightmare_mode
  puts `clear`
  computer_player("nightmare")
end



def run_this_version (mode)
  if mode == 1
    play_easy_mode
  elsif mode == 2
    play_normal_mode
  elsif mode == 3
    play_hard_mode
  elsif mode == 4
    play_nightmare_mode
  else
    exit
  end
end


def tic_tac_toe
  mode = greeting
  run_this_version(mode)
end

def play_again?
  puts " Would you like to play again? Type y for yes or type anything else to exit"
  yes_or_no = gets.chomp
  if yes_or_no == "y"
    tic_tac_toe
    play_again?
  else
    exit
  end
end

tic_tac_toe
play_again?
