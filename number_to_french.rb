require_relative 'number.rb'
require_relative 'thousand.rb'


def translate_to_french(number)
  if number == 0
    return ZERO
  end

  thousand = Thousand.new (number)
  rest = Number.new (thousand.rest)

  [thousand, rest]
      .map(&:to_s)
      .reject {|c| c == ZERO}
      .join("-")
end
