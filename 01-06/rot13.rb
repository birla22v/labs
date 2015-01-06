require "pry"

string = "abcdefghijklmnopqrstuvwxyz"
alphabet = {}

string.each_char do |i|
  alphabet[i] = string[i]
    if (i.ord <=109 )
      c = i.ord+13
      alphabet[i] = string[c.chr]
    else
      c=i.ord-13
      alphabet[i] = string[c.chr]
    end
end

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

# binding.pry

method(method.to_sym).call(string, alphabet)

# if method == "encode"
#   encode(string, alphabet)
# elsif method =="decode"
#   decode(string, alphabet)
# end
