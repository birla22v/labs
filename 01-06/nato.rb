# Write your own NATO alphabet.
# There should be a function to
# encode and decode.
# The encode function will take a
# string replace all upper and lower
# case characters with their "NATO"
#   equivalents and return the result.
#   The decode function will take a
#   string, replace the "NATO" characters
#   with their normal letter form
#   and return that.
#   Non-alphabetical should be copied/stay
#   the same in both cases.


#hash table for alphabet
 alphabet = {"a"=>"!", "b" => "@","c"=>"#" ,"d"=>"%","e"=>"^", "f"=>"$",
  "g"=>"&", "h"=>"*", "i"=>"(","j"=>")", "k"=>"1", "l"=>"2","m"=>"3", "n"=>"4",
   "o"=>"5","p"=>"6","q"=>"7","r"=>"8","s"=>"9","t"=>"0","u"=>"{","v"=>"}",
  "w"=>"[","x"=>"]","y"=>"<","z"=>">"}

def encode(message, alphabet)
  message.downcase!
  result=""
  message.each_char do |i|
    result<<alphabet[i]
  end
  puts result;

end

def decode(message, alphabet)
  encode(message, alphabet.invert)
end

puts "For encoding, type encode. For decoding type decode"
method = gets.chomp
puts "Enter String to encode/ decode"
string = gets.chomp

method(method.to_sym).call(string, alphabet)

# if method == "encode"
#   encode(string, alphabet)
# elsif method =="decode"
#   decode(string, alphabet)
# end
