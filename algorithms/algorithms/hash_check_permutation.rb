def check_permutation(s1 = '', s2 = '')
  if s1 == s2
    true
  else
    s1.split('').sort == s2.split('').sort
  end
end

check_permutation('asd', 'dsa')
check_permutation('ass', 'dsa')
