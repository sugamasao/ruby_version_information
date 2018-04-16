require_relative "ruby_version_information/version"
require_relative "ruby_version_information/extract"
require_relative "ruby_version_information/generate"

module RubyVersionInformation
  def self.run
    data = Extract.new.run
    dir = File.expand_path('../../data', __FILE__)
    Generate.new(dir).save(data)
  end
end
