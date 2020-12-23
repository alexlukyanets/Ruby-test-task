# frozen_string_literal: false

def string_proces(string, regex)
  array_words = []
  hash_words = Hash.new(0)
  string.downcase!

  string.scan(regex) do |match|
    array_words += match
  end

  array_words.each do |i|
    hash_words[i] += 1
  end

  sort_words = hash_words.sort_by { |_, v| -v }.slice(0, 3)
  not_ubiqe_counter = hash_words.count { |_, v| v == 1 }

  return [] if not_ubiqe_counter < 3 || hash_words.size == not_ubiqe_counter

  sort_words.map{ |k, _| k }
end

def main
  regex = /[^a-zA-Z']?([a-zA-Z']+)[^a-zA-Z']?/m
  puts 'do you want to run the task with pre-defined data? (y/n)'
  answer = gets.chomp
  if answer == 'y'
    string = 'This is my test task.
  I\'d to show my great task;
  I solved problems in my-task. I\'ll prepare to interview/colloquy because task is ready'
  else
    puts 'Enter your string:'
    string = gets.chomp
  end

  puts "#{'#' * 50} STRING #{'#' * 42}"
  puts string
  puts '#' * 100
  print "Most non-unique words: #{string_proces(string, regex)}"
end
main
