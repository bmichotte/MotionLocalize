# -*- encoding: utf-8 -*-
Gem::Specification.new do |spec|
  spec.name          = "MotionLocalize"
  spec.version       = "0.0.1"
  spec.authors       = ["Benjamin Michotte"]
  spec.email         = ["bmichotte@gmail.com"]
  spec.description   = %q{Easy localization for RubyMotion.}
  spec.summary       = %q{Localization for iOS and Android made easy.}
  spec.homepage      = "https://github.com/bmichotte/MotionLocalize"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_runtime_dependency 'motion-yaml', '>= 1.4'
end
