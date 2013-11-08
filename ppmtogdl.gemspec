# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ppmtogdl/version'

Gem::Specification.new do |spec|
  spec.name          = "ppmtogdl"
  spec.version       = PpmToGdl::VERSION
  spec.authors       = ["Jeff McAffee"]
  spec.email         = ["jeff@ktechsystems.com"]
  spec.description   = %q{PpmToGdl generates GDL PPM definitions from a PrimaryParameters.xml file.}
  spec.summary       = %q{GDL PPM Generator Utility}
  spec.homepage      = ""
  spec.license       = "Mine"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  #spec.add_runtime_dependency "win32ole"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "ktcommon"
  spec.add_runtime_dependency "xmlutils"
end
