class AnagramService
  def anagram?(first_word, second_word)
    sort_anagram(first_word) == sort_anagram(second_word)
  end

  private

  def sort_anagram(word)
    word.downcase.split('').sort.join('')
  end
end
