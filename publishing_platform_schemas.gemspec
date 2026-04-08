# frozen_string_literal: true

require_relative "lib/publishing_platform_schemas/version"

Gem::Specification.new do |spec|
  spec.name = "publishing_platform_schemas"
  spec.version = PublishingPlatformSchemas::VERSION
  spec.authors = ["Publishing Platform"]

  spec.summary = "Gem to work with the Publishing Platform content schemas"
  spec.description = "Gem to work with the Publishing Platform content schemas"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  # This should be kept in sync with the json-schema version of publishing-api.
  spec.add_dependency "json-schema", ">= 2.8", "< 6.2"

  spec.add_development_dependency "climate_control", "~> 1.2"
  spec.add_development_dependency "publishing_platform_rubocop", "~> 0.2"
  spec.add_development_dependency "simplecov", "~> 0.22"
end
