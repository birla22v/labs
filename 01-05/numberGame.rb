#online resource: http://stackoverflow.com/questions
#/2289381/how-to-time-an-operation-in-milliseconds-in-ruby

puts "Guess a number between 1 and 100! You get 10 tries and 20 seconds"

t1 = Time.now

#int variable for number of tries
count = 0

#maximum number of tries
max = 10

#randomly generated number
generatedNum = rand(100)+1

#user guessed number
guessNum = gets.to_i

#to track time
time_lapsed=0
time_allowed = 20


while guessNum != generatedNum && count < max

  t2 = Time.now
  time_lapsed = t2-t1
  puts "time lapsed: #{time_lapsed}"

  #characters that are not numbers get mapped to 0
  if guessNum==0
    puts "Invalid input. Enter a number between 1 to 100"
    if time_lapsed >time_allowed
      break
    end
    guessNum=gets.to_i
    t2 = Time.now
    time_lapsed = t2-t1
    if time_lapsed >time_allowed
      break
    end

  elsif guessNum>generatedNum
    puts "Your guess was too high! Try again!"
    if time_lapsed >time_allowed
      break
    end
    guessNum=gets.to_i
    count+=1
    t2 = Time.now
    time_lapsed = t2-t1
    if time_lapsed >time_allowed
      break
    end

  else
    puts "Your guess was too low! Try again!"
    if time_lapsed >time_allowed
      break
    end
    guessNum=gets.to_i
    count+=1
    t2 = Time.now
    time_lapsed = t2-t1
    if time_lapsed >time_allowed
      break
    end
  end
end

if time_lapsed >= time_allowed
  puts "Out of time!"
end

if count == max
  puts "Out of tries!"
end

if guessNum == generatedNum
  puts "You got the right number!"
else
  puts "The number was #{generatedNum}!"
end
