require 'test/unit'

def translate_to_french(number)
  units_as_string = ["zero", "un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf"]
  units_as_string[number]
end
