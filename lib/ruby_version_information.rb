require_relative "ruby_version_information/version"
require_relative "ruby_version_information/extract"
require_relative "ruby_version_information/generate"
require_relative "ruby_version_information/import"
require_relative "ruby_version_information/differ"

module RubyVersionInformation
  def self.generate
    data = Extract.new.run
    dir = File.expand_path('../../data', __FILE__)
    Generate.new(dir).save(data)
  end

  def self.diff(versions)
    o, n = Import.new(versions).load
    puts "#{ o['version'] } to #{ n['version'] }"

    differ = Differ.new(o, n)
    differ.show_classes
    differ.show_methods
  end
end
