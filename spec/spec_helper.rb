if ENV['SCOV']
  require 'simplecov'
  SimpleCov.start do
    puts "I am started?! #{Process.pid}"
    add_filter "/spec/"
  end
end

# bahia needs a non-nil RUBYLIB env var.
ENV['RUBYLIB'] ||= ''

require 'minitest/autorun'
require 'bahia'

class MiniTest::Unit::TestCase
  include Bahia
end

