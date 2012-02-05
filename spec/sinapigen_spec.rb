require File.expand_path("../spec_helper.rb", __FILE__)

describe "sinapigen" do
  it "prints usage without args" do
    sinapigen
    stdout.must_equal "Usage: sinapigen\n"
  end
  
  it "prints help when given -h" do
    sinapigen "-h"
    stdout.must_include "Show this message"
  end

  it "prints help when given --help" do
    sinapigen "--help"
    stdout.must_include "Show this message"
  end
end

