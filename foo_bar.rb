
def generate_mod_array mod, array, code
    mod = array.map{ |x| x%modulus }
    mod.join(',').gsub('0',code).gsub(/[1234]/,'').split(',')
end

def remove_multiples array, m1, m2
    array.map{|x| if x%m1 != 0 and x%m2 !=0 then x end }
end

list = (1..100).map { |x| x}

numbers = remove_multiples list, 3, 5

mod3 = generate_mod_array 3, list, 'Foo' 
mod5 = generate_mod_array 5, list, 'Bar'

foo_bar = mod3.zip(mod5).map{|x| x.join('')}

final = foo_bar.zip(numbers).map{|x| x.join('')}

puts final

