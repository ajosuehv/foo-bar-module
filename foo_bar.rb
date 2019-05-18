#! /usr/bin/ruby
class CodingTest
  def generate_mod_array mod, array, code
    mod = array.map{ |x| x%mod }
    mod.join(',').gsub(',0',',' + code).gsub(/[0123456789]/,' ').gsub('  ',' ').split(',')
  end

  def remove_multiples array, m1, m2
    array.map{|x| if x%m1 != 0 and x%m2 !=0 then x end }
  end

  def main max, multiple1, code1, multiple2, code2
    list = (1..max).map { |x| x}
    numbers = remove_multiples list, multiple1, multiple2
    mod_m1 = generate_mod_array multiple1, list, code1
    mod_m2 = generate_mod_array multiple2, list, code2
    foo_bar = mod_m1.zip(mod_m2).map{|x| x.join('')}
    final = foo_bar.zip(numbers).map{|x| x.join('').gsub(' ','')}
  end
end
