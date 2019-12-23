require_relative 'lib/hibana/version'

Gem::Specification.new do |spec|
  spec.name          = "hibana"
  spec.version       = Hibana::VERSION
  spec.authors       = ["r7kamura"]
  spec.email         = ["r7kamura@gmail.com"]

  spec.summary       = "A small strict web framework."
  spec.homepage      = "https://github.com/r7kamura/hibana"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/r7kamura/hibana/blob/master/CHANGELOG"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'hanami-router'
  spec.add_runtime_dependency 'rack'
  spec.add_runtime_dependency 'tilt'
end
