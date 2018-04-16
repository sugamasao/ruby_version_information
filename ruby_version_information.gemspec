
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby_version_information/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby_version_information"
  spec.version       = RubyVersionInformation::VERSION
  spec.authors       = ["sugamasao"]
  spec.email         = ["sugamasao@gmail.com"]

  spec.summary       = %q{Generate Ruby Class and Method list.}
  spec.description   = %q{Generate Ruby Class and Method list.}
  spec.homepage      = "https://github.com/sugamasao/ruby_version_information"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
