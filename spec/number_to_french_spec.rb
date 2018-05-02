require './number_parser'

describe "NumberParser" do
  context "number less than 20" do
    it('translate 0 to zéro') {expect(translate_to_french 0).to eql 'zéro'}
    it('translate 1 to un') {expect(translate_to_french 1).to eql 'un'}
    it('translate 2 to deux') {expect(translate_to_french 2).to eql 'deux'}
    it('translate 3 to trois') {expect(translate_to_french 3).to eql 'trois'}
    it('translate 4 to quatre') {expect(translate_to_french 4).to eql 'quatre'}
    it('translate 5 to cinq') {expect(translate_to_french 5).to eql 'cinq'}
    it('translate 6 to six') {expect(translate_to_french 6).to eql 'six'}
    it('translate 7 to sept') {expect(translate_to_french 7).to eql 'sept'}
    it('translate 8 to huit') {expect(translate_to_french 8).to eql 'huit'}
    it('translate 9 to neuf') {expect(translate_to_french 9).to eql 'neuf'}
    it('translate 10 to dix') {expect(translate_to_french 10).to eql 'dix'}
    it('translate 11 to onze') {expect(translate_to_french 11).to eql 'onze'}
    it('translate 12 to douze') {expect(translate_to_french 12).to eql 'douze'}
    it('translate 13 to treize') {expect(translate_to_french 13).to eql 'treize'}
    it('translate 14 to quatorze') {expect(translate_to_french 14).to eql 'quatorze'}
    it('translate 15 to quinze') {expect(translate_to_french 15).to eql 'quinze'}
    it('translate 16 to seize') {expect(translate_to_french 16).to eql 'seize'}
    it('translate 17 to dix-sept') {expect(translate_to_french 17).to eql 'dix-sept'}
    it('translate 18 to dix-huit') {expect(translate_to_french 18).to eql 'dix-huit'}
    it('translate 19 to dix-neuf') {expect(translate_to_french 19).to eql 'dix-neuf'}
  end

  context "tens" do
    it('translate 10 to dix') {expect(translate_to_french 10).to eql 'dix'}
    it('translate 20 to vingt') {expect(translate_to_french 20).to eql 'vingt'}
    it('translate 30 to trente') {expect(translate_to_french 30).to eql 'trente'}
    it('translate 40 to quarante') {expect(translate_to_french 40).to eql 'quarante'}
    it('translate 50 to cinquante') {expect(translate_to_french 50).to eql 'cinquante'}
    it('translate 60 to soixante') {expect(translate_to_french 60).to eql 'soixante'}
    it('translate 70 to soixante-dix') {expect(translate_to_french 70).to eql 'soixante-dix'}
    it('translate 80 to quatre-vingts') {expect(translate_to_french 80).to eql 'quatre-vingts'}
    it('translate 90 to quatre-vingt-dix') {expect(translate_to_french 90).to eql 'quatre-vingt-dix'}
  end

  context "number below 70" do
    it('translate 22 to vingt-deux') {expect(translate_to_french 22).to eql 'vingt-deux'}
    it('translate 33 to trente-trois') {expect(translate_to_french 33).to eql 'trente-trois'}
    it('translate 54 to cinquante-quatre') {expect(translate_to_french 54).to eql 'cinquante-quatre'}
    it('translate 69 to soixante-neuf') {expect(translate_to_french 69).to eql 'soixante-neuf'}
  end

  context "quatre-vingts takes an S when not followed by anything" do
    it('translate 80 to quatre-vingts, with an S') {expect(translate_to_french 80).to eql 'quatre-vingts'}
    it('translate 82 to quatre-vingt-deux, without  S') {expect(translate_to_french 82).to eql 'quatre-vingt-deux'}
    it('translate 84 to quatre-vingt-quatre, without  S') {expect(translate_to_french 84).to eql 'quatre-vingt-quatre'}
    it('translate 89 to quatre-vingt-neuf, without  S') {expect(translate_to_french 89).to eql 'quatre-vingt-neuf'}
  end

  context "70 to 80 numbers and 90 to 100 numbers do not use the same pattern as others" do
    it('translate 72 to soixante-douze') {expect(translate_to_french 72).to eql 'soixante-douze'}
    it('translate 73 to soixante-treize') {expect(translate_to_french 73).to eql 'soixante-treize'}
    it('translate 79 to soixante-dix-neuf') {expect(translate_to_french 79).to eql 'soixante-dix-neuf'}
    it('translate 92 to quatre-vingt-douze') {expect(translate_to_french 92).to eql 'quatre-vingt-douze'}
    it('translate 96 to quatre-vingt-seize') {expect(translate_to_french 96).to eql 'quatre-vingt-seize'}
    it('translate 99 to quatre-vingt-dix-neuf') {expect(translate_to_french 99).to eql 'quatre-vingt-dix-neuf'}
  end

  context "hundreds: like vingts, cents can be plural if it is not followed by something else" do
    it('translate 100 to cent') {expect(translate_to_french 100).to eql 'cent'}
    it('translate 200 to deux-cents, with an S') {expect(translate_to_french 200).to eql 'deux-cents'}
    it('translate 600 to six-cents, with an S') {expect(translate_to_french 600).to eql 'six-cents'}
    it('translate 305 to trois-cent-cinq, without S at cent') {expect(translate_to_french 305).to eql 'trois-cent-cinq'}
    it('translate 480 to quatre-cent-quatre-vingts, without S at cent, but with an S at vingts') {expect(translate_to_french 480).to eql 'quatre-cent-quatre-vingts'}
    it('translate 999 to neuf-cent-quatre-vingt-dix-neuf, without S at cent') {expect(translate_to_french 999).to eql 'neuf-cent-quatre-vingt-dix-neuf'}
  end

  context "some numbers ending with 1 are joined with dashes, others with dashes and 'et'" do
    # traditional french use "vingt et un" with spaces, but since 1990 reform the rule is "vingt-et-un" with dashes.
    # and it is easier to do!
    it('translate 21 to vingt-et-un') {expect(translate_to_french 21).to eql 'vingt-et-un'}
    it('translate 31 to trente-et-un') {expect(translate_to_french 31).to eql 'trente-et-un'}
    it('translate 41 to quarante-et-un') {expect(translate_to_french 41).to eql 'quarante-et-un'}
    it('translate 51 to cinquante-et-un') {expect(translate_to_french 51).to eql 'cinquante-et-un'}
    it('translate 61 to soixante-et-un') {expect(translate_to_french 61).to eql 'soixante-et-un'}
    it('translate 71 to soixante-et-onze') {expect(translate_to_french 71).to eql 'soixante-et-onze'}
    it('translate 81 to quatre-vingt-un, without "et"') {expect(translate_to_french 81).to eql 'quatre-vingt-un'}
    it('translate 91 to quatre-vingt-onze, without "et"') {expect(translate_to_french 91).to eql 'quatre-vingt-onze'}
    it('translate 101 to cent-un, without "et"') {expect(translate_to_french 101).to eql 'cent-un'}
    it('translate 111 to cent-onze, without "et"') {expect(translate_to_french 111).to eql 'cent-onze'}
    it('translate 151 to cent-cinquante-et-un, with "et"') {expect(translate_to_french 151).to eql 'cent-cinquante-et-un'}
    it('translate 991 to neuf-cent-quatre-vingt-onze, without "et"') {expect(translate_to_french 991).to eql 'neuf-cent-quatre-vingt-onze'}
  end

  context "from thousand to millions. Like vingt and cent, mille can be plural" do
    it('translate 1000 to mille') {expect(translate_to_french 1000).to eql 'mille'}
    it('translate 1045 to mille-quarante-cinq') {expect(translate_to_french 1045).to eql 'mille-quarante-cinq'}
    it('translate 1145 to mille-cent-quarante-cinq') {expect(translate_to_french 1145).to eql 'mille-cent-quarante-cinq'}
    it('translate 2000 to deux-milles, with an S') {expect(translate_to_french 2000).to eql 'deux-milles'}
    it('translate 2005 to deux-mille-cinq, without an S') {expect(translate_to_french 2005).to eql 'deux-mille-cinq'}
    it('translate 9999 to neuf-mille-neuf-cent-quatre-vingt-dix-neuf') {expect(translate_to_french 9999).to eql 'neuf-mille-neuf-cent-quatre-vingt-dix-neuf'}
    it('translate 10000 to dix-milles, with an S') {expect(translate_to_french 10000).to eql 'dix-milles'}
    it('translate 20000 to vingt-milles, with an S') {expect(translate_to_french 20000).to eql 'vingt-milles'}
    it('translate 80000 to quatre-vingt-milles, with an S at mille but not vingt') {expect(translate_to_french 80000).to eql 'quatre-vingt-milles'}
    it('translate 100000 to cent-milles, with an S') {expect(translate_to_french 100000).to eql 'cent-milles'}
    it('translate 153622 to cent-cinquante-trois-mille-six-cent-vingt-deux') {expect(translate_to_french 153622).to eql 'cent-cinquante-trois-mille-six-cent-vingt-deux'}
    it('translate 153622 to cent-cinquante-trois-mille-six-cent-vingt-deux') {expect(translate_to_french 153622).to eql 'cent-cinquante-trois-mille-six-cent-vingt-deux'}
    it('translate 999999 to neuf-cent-quatre-vingt-dix-neuf-mille-neuf-cent-quatre-vingt-dix-neuf') {expect(translate_to_french 999999).to eql 'neuf-cent-quatre-vingt-dix-neuf-mille-neuf-cent-quatre-vingt-dix-neuf'}
  end

  context "specific rule for Et when number ends with 1 are still working for thousands" do
    it('translate 2171 to deux-mille-cent-soixante-et-onze, with et') {expect(translate_to_french 2171).to eql 'deux-mille-cent-soixante-et-onze'}
    it('translate 2191 to deux-mille-cent-quatre-vingt-onze, without et') {expect(translate_to_french 2191).to eql 'deux-mille-cent-quatre-vingt-onze'}

    it('translate 51051 to cinquante-et-un-mille-cinquante-et-un, with et in both thousand and units') {expect(translate_to_french 51051).to eql 'cinquante-et-un-mille-cinquante-et-un'}
    it('translate 81081 to quatre-vingt-un-mille-quatre-vingt-un, without et') {expect(translate_to_french 81081).to eql 'quatre-vingt-un-mille-quatre-vingt-un'}
    it('translate 51081 to cinquante-et-un-mille-quatre-vingt-un, with et in thousand but not in units') {expect(translate_to_french 51081).to eql 'cinquante-et-un-mille-quatre-vingt-un'}
    it('translate 81051 to quatre-vingt-un-mille-cinquante-et-un, with et in units but not in thousands') {expect(translate_to_french 81051).to eql 'quatre-vingt-un-mille-cinquante-et-un'}
  end
end

def translate_to_french(number)
  NumberParser.new(number).to_french
end