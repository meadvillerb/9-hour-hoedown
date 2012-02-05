if ENV['SCOV']
  require 'simplecov'
  SimpleCov.start do
    puts "I am started?! #{Process.pid}"
    add_filter "/spec/"
  end
end

require 'minitest/autorun'

