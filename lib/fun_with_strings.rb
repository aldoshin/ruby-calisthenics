module FunWithStrings
  def palindrome?
    downClean = self.downcase.gsub(/[\W\d]/, '')
    downClean == downClean.reverse
    # your code here
  end
  
  def count_words
    self.downcase.gsub(/[^\w\s]/, '').split.inject(Hash.new(0)) do |acc, el|
      key = el.downcase
      acc[key] = acc[key] + 1
      acc
    end
  end
  
  def anagram_groups
    hash = self.split.inject(Hash.new([])) do |acc, word|
      key = word.chars.sort.join
      acc[key] = acc[key] + [word]
      acc
    end
    hash.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end

# puts "Hello"
# empty_anam = "".anagram_groups
# puts "#{empty_anam}"
# x_anam ="scream cars for four scar creams".anagram_groups
# puts "#{x_anam}"

