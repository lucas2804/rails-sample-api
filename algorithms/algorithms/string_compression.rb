# String Compression: Implement a method to perform basic string compression using the counts of repeated characters. For example, the string aabcccccaaa would become a2blc5a3. If the "compressed" string would not become smaller than the original string, your method should return
# the original string. You can assume the string has only uppercase and lowercase letters (a - z).

def string_compression(string)
  count_char_hash = count_char(string)

  result = ''
  count_char_hash.each do |key, value|
    result += "#{key}#{value}"
  end
  if result.length == string.length
    string
  else
    result
  end
end

def count_char(string)
  hash = {}

  string.each_char do |c|
    if hash[c]
      hash[c] += 1
    else
      hash[c] = 1
    end
  end

  hash
end

string = 'aabcccccaaa'
string_compression(string)

string = 'aabccd'
string_compression(string)
