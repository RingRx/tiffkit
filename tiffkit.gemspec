
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tiffkit/version"

Gem::Specification.new do |spec|
  spec.name          = "tiffkit"
  spec.version       = Tiffkit::VERSION
  spec.authors       = ["RingRx"]
  spec.email         = ["contact@ringrx.com"]

  spec.summary       = %q{Tool to merge tiff files}
  spec.description   = %q{Wrapper to merge tiff using tiffcp}
  spec.homepage      = "https://github.com/RingRx/tiffkit"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # tty-command 0.10+ moves to pastel ~> 0.8, which drops the equatable
  # dependency that breaks under Ruby 3.x (raising
  # "wrong number of arguments (given 1, expected 0)" from inside merge).
  # 0.9.0 pins pastel ~> 0.7 / equatable ~> 0.7 and is not Ruby 3.1 safe.
  spec.add_dependency "tty-command", "~> 0.10"

  spec.add_development_dependency "rspec-core"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
end
