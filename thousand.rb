class Thousand < Number
  MILLE = "mille"
  attr_accessor :rest

  def initialize number
    @rest = number % 1000
    @should_pluralize = @rest == 0
    super number / 1000
  end

  def to_s
    if @original_number == 0
      return ZERO
    end

    if @original_number == 1
      return MILLE
    end

    number_as_string = super + "-" + MILLE

    @should_pluralize ? pluralize(number_as_string, MILLE) : number_as_string
  end
end