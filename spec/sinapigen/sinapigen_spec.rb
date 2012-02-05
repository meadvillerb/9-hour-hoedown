require File.expand_path("../../spec_helper.rb", __FILE__)

describe Sinapigen do
  it "should define the current version" do
    Sinapigen::VERSION.must_equal "0.1.0"
  end
end

