module RubyVersionInformation
  class Import
    def initialize(versions)
      @old_version, @new_version = [Gem::Version.create(versions[0]), Gem::Version.create(versions[1])].sort
    end

    def load
      require 'json'
      dir = File.expand_path('../../../data', __FILE__)
      o = JSON.load(File.read(File.join(dir, @old_version.to_s + '.json')))
      n = JSON.load(File.read(File.join(dir, @new_version.to_s + '.json')))
      [o, n]
    end

  end
end