# Input: "Mr John Smith ", 13
# Output: "Mr%20John%20Smith"
def urlify(string)
  string.strip!
  if string.include?(' ') == true
    string.gsub!(' ', '%20')
  else
    string
  end
end

string = 'Mr John Smith   '
urlify(string)
