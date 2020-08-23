class Linter
  attr_reader :error

  def initialize
    @stack = []
  end

  def lint(text)
    text.each_char.with_index do |char, index|
      if opening_brace?(char)
        @stack.push(char)
      elsif closing_brace?(char)
        if closes_most_recent_opening_brace?(char)
          @stack.pop
        else
          @error = "Incorrect closing brace: #{char} at #{index}"
          return false
        end
      end
    end

    if @stack.any?
      @error = "#{@stack.last} does not have a closing"
    else
      puts 'The syntax is correct'
      return true
    end

    puts @error
  end

  private

  def opening_brace?(char)
    %w|( [ {|.include?(char)
  end

  def closing_brace?(char)
    %w|) ] }|.include?(char)
  end

  def opening_brace_of(char)
    {
      ')' => '(',
      ']' => '[',
      '}' => '{'
    }[char]
  end

  def closes_most_recent_opening_brace?(char)
    opening_brace_of(char) == most_recent_opening_brace
  end

  def most_recent_opening_brace
    @stack.last
  end
end

Linter.new.lint('( var x = { y: [1, 2, 3] } )')
Linter.new.lint('( var x = { y: [1, 2, 3] ')
