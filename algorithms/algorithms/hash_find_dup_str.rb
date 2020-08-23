def hasDuplicateValueWithHash(string)
  hash = {}

  string.each_char do |c|
    if hash[c]
      puts "Duplicate #{c}"
      return true
    else
      hash[c] = 1
    end
  end

  puts 'String does not have dup chars'
  false
end

string = 'zxcvbnm'
hasDuplicateValueWithHash(string)

string = 'zxcvbnmz'
hasDuplicateValueWithHash(string)
