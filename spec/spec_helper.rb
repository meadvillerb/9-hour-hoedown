if ENV['SCOV']
  require 'simplecov'
  SimpleCov.start do
    add_filter "/spec/"
  end
end

# bahia needs a non-nil RUBYLIB env var.
ENV['RUBYLIB'] ||= ''

require 'minitest/autorun'
require 'minitest/emoji'
require 'bahia'
require 'sinapigen'

class MiniTest::Unit::TestCase
  include Bahia
end

