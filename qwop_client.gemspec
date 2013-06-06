# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qwop_client/version'

Gem::Specification.new do |spec|
  spec.name          = "qwop_client"
  spec.version       = QwopClient::VERSION
  spec.authors       = ["DailyBurn"]
  spec.email         = ["dev@dailyburn.com"]
  spec.description   = %q{QwopClient is a client for publishing messages to an NSQ instance}
  spec.summary       = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.6"

  spec.add_dependency "actionmailer", ">= 3.0.0"
  spec.add_dependency "ruby_nsq", "~> 0.0.2"
end