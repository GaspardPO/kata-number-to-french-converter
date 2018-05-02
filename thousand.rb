class Thousand < Number
  MILLE = 'mille'.freeze
  attr_accessor :rest

  def initialize(number)
    @rest = number % 1000
    @should_pluralize = @rest.zero?
    super number / 1000
  end

  def to_s
    return ZERO if @original_number.zero?
    return MILLE if @original_number == 1
    number_as_string = super + '-' + MILLE
    @should_pluralize ? pluralize(number_as_string, MILLE) : number_as_string
  end

  def pluralize_vingt_and_cent(number_as_string)
    # never pluralize as it will always be followed by "Mille"
    number_as_string
  end
end
