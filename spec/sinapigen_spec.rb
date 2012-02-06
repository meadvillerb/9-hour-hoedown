require File.expand_path("../spec_helper.rb", __FILE__)

describe "sinapigen" do
  it "prints usage without args" do
    sinapigen
    stdout.must_equal "Usage: sinapigen [opts] <api_name>\n"
  end
  
  it "prints help when given -h" do
    sinapigen "-h"
    stdout.must_include "Show this message"
  end

  it "prints help when given --help" do
    sinapigen "--help"
    stdout.must_include "Show this message"
  end

  describe "file creation" do
    def prepare_scratch_dir
      remove_scratch_dir
      FileUtils.mkdir_p './scratch'
    end
    
    def remove_scratch_dir
      FileUtils.rm_rf './scratch' if Dir.exists?('./scratch')
    end

    def inside_scratch_dir &block
      Dir.chdir('./scratch', &block)
    end

    before do
      prepare_scratch_dir
    end

    after do
      remove_scratch_dir
    end

    it "creates the named api directory" do
      inside_scratch_dir do
        sinapigen "test_app"
        Dir.exists?('./test_app').must_equal true
      end
    end

    it "creates the client.rb and server.rb files" do
      inside_scratch_dir do
        sinapigen "test_app"
        File.exists?('./test_app/client.rb').must_equal true
        File.exists?('./test_app/server.rb').must_equal true
      end
    end

    it "creates only the client.rb file when --client is given" do
      inside_scratch_dir do
        sinapigen "--client test_app"
        File.exists?('./test_app/client.rb').must_equal true
        File.exists?('./test_app/server.rb').must_equal false
      end
    end

    it "creates only the server.rb file when --server is given" do
      inside_scratch_dir do
        sinapigen "--server test_app"
        File.exists?('./test_app/server.rb').must_equal true
        File.exists?('./test_app/client.rb').must_equal false
      end
    end
  end

end

