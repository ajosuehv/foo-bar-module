#! /usr/bin/ruby
require_relative 'foo_bar'
coding_test = CodingTest.new
puts coding_test.main ARGV[0].to_i, ARGV[1].to_i, ARGV[2], ARGV[3].to_i, ARGV[4]
