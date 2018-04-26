class NumberParser
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def to_french
    return ZERO if number == 0

    thousand = Thousand.new(number)
    rest = Number.new (thousand.rest)

    [thousand, rest]
        .map(&:to_s)
        .reject {|c| c == ZERO}
        .join("-")
  end
end