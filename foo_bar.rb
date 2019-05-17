#! /usr/bin/ruby
class CodingTest
  def generate_mod_array mod, array, code
    mod = array.map{ |x| x%mod }
    mod.join(',').gsub(',0',','+code).gsub(/[i0123456789]/,' ').split(',')
  end

  def remove_multiples array, m1, m2
    array.map{|x| if x%m1 != 0 and x%m2 !=0 then x end }
  end

  def main max, multiple1, multiple2
    list = (1..max).map { |x| x}
    numbers = remove_multiples list, multiple1, multiple2
    mod_m1 = generate_mod_array multiple1, list, 'Foo'
    mod_m2 = generate_mod_array multiple2, list, 'Bar'
    foo_bar = mod_m1.zip(mod_m2).map{|x| x.join('')}
    final = foo_bar.zip(numbers).map{|x| x.join('').gsub(' ','')}
    puts final
  end
end

coding_test = CodingTest.new
coding_test.main ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i
