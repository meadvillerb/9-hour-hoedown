module Sinapigen
  class Command
    def initialize api_name
      @api_name = api_name
    end

    def run opts
      Dir.mkdir("./#{@api_name}")
      Dir.chdir("./#{@api_name}") do
        create_client if opts[:client]
        create_server if opts[:server]
      end
    end

    def create_client
      create_file "client.rb", "Client"
    end

    def create_server
      create_file "server.rb", "Server"
    end

  private
    def create_file name, contents
      File.open("./#{name}", "w") do |f|
        f.puts contents
      end
    end
  end
end
