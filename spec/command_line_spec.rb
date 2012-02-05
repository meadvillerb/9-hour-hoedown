require File.expand_path("../spec_helper.rb", __FILE__)

describe "sinapigen" do
  it "prints usage without args" do
    sinapigen
    stdout.should == "Usage: sinapigen"
  end
end

