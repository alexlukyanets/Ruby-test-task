# frozen_string_literal: true

def add_odd_even(string)
  string = string.chars
  even = string.select.with_index { |_, idx| idx.even? }
  odd = string.select.with_index { |_, idx| idx.odd? }
  even = odd + even
  even.join
end

def decrypt_str(string)
  delimiter = (string.length / 2).to_i
  part_one = string.slice(0, delimiter).split('')
  part_two = string.slice(delimiter, string.size).split('')
  part_two.zip(part_one).join
end

def encryption(str, num)
  return str if !str || num <= 0

  str.downcase!
  num.times do
    str = add_odd_even(str)
  end
  str
end

def decryption(str, num)
  return str if !str || num <= 0

  num.times do
    str = decrypt_str str
  end
  str
end

def main
  puts 'Enter your string:'
  string = gets.chomp
  puts 'Enter multiplier:'
  multiplier = gets.chomp.to_i
  enc = encryption(string, multiplier)
  puts "Encrypted string: #{enc}"
  puts "Decrypted string: #{decryption(enc, multiplier)}"
end
main
