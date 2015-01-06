puts "Guess a number between 1 and 100!"

guessNum = gets.to_i

generatedNum = rand(100)+1

while guessNum != generatedNum
  if guessNum>generatedNum
    puts "Your guess was too high! Try again!"
    guessNum=gets.to_i
  else
    puts "Your guess was too low! Try again!"
    guessNum=gets.to_i
  end
end

puts "Yes, the number was #{generatedNum}!"
