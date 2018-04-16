require 'json'
module RubyVersionInformation
  class Generate
    def initialize(dir)
      @dir = dir
    end

    def save(data)
      path = File.join(@dir, "%s.json" % data[:version])
      File.write(path, data.to_json)
    end
  end
end