# frozen_string_literal: false

def string_proces(string, regex)
  hash_words = Hash.new(0)
  string.downcase!

  string.scan(regex) do |match|
    hash_words[match.join] += 1
  end

  not_uniqe_counter = hash_words.count { |_, v| v == 1 }

  return [] if not_uniqe_counter < 3
  return 'No duplicate values' if hash_words.size == not_uniqe_counter

  hash_words.sort_by { |_, v| -v }.slice(0, 3).map{ |k, _| k }
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