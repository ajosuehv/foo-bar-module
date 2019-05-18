require_relative 'foo_bar'
require 'test/unit'

class TestCodingTest < Test::Unit::TestCase
  def test_generate_mod_array
    max = 100
    m1 = rand(100)
    m2 = rand(100)
    code1 = "Foo"
    list = (1..100).map{|x| x}
    foo = CodingTest.new.generate_mod_array m1, list, code1
    assert_not_nil foo
    foo.each_with_index do |x, i|
      if (i+1)%m1==0 then
        assert_equal(x, code1)
      else
        assert_equal " ", x
      end
    end
  end
  def test_remove_multiples
    max = 100
    m1 = rand(100)
    m2 = rand(100)
    list = (1..100).map{|x| x}
    numbers = CodingTest.new.remove_multiples list, m1, m2
    assert_not_nil numbers
    numbers.each_with_index do |x, i|
      if (i+1)%m1==0 or (i+1)%m2==0 then
        assert_nil x
      else
        assert_equal x, i+1
      end
    end
  end
  def test_main
    max = 100
    m1 = rand(100)
    m2 = rand(100)
    code1 = 'Foo'
    code2 = 'Bar'
    output = CodingTest.new.main max, m1, code1, m2, code2
    output.each_with_index do |x, i|
      label = ""
      if (i+1)%m1==0 then
        label += "Foo"
      end
      if (i+1)%m2==0 then
        label += "Bar"
      end
      if label == "" then
        assert_equal (i+1), x.to_i
      else
        assert_equal x, label
      end
    end
  end
end
