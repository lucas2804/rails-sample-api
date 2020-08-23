# Input: Tact Coa
# Output: True (permutations: "taco cat", "atco eta", etc.)
# Palindrome hay còn gọi là xâu đối xứng, xâu đối gương là tên gọi của những xâu kí tự mà khi viết từ phải qua trái hay từ trái qua phải thì xâu đó không thay đổi. VD: MADAM, IOI,… Nhờ tính chất đặc biệt đó mà có khá nhiều bài tập có liên quan đến Palindrome

# Input "Tact Coa" "Tact Cob"
# Output "TRUE", "FALSE"
# Note: "Tact Coa" => "tac o cat" => true
# Note: "Tact Cob" => "tac o bat" => false
def palindrome_permutation(string)
  string.downcase!
  hash_count = count_dup_char(string)
  un_palind_count = 0
  hash_count.each do |hash|
    next unless hash[1].odd?
    un_palind_count += 1
    if un_palind_count > 1
      puts "#{string}: The string is not a palindrome"
      return false
    end
  end
  puts "#{string}: The string is a palindrome"
  true
end

def count_dup_char(string)
  hash = {}
  string.each_char do |c|
    if c != ' '
      if hash[c]
        hash[c] += 1
      else
        hash[c] = 1
      end
    end
  end
  puts hash
  hash
end

string = 'Tact Coa'
palindrome_permutation(string)
string = 'Tact Cob'
palindrome_permutation(string)
