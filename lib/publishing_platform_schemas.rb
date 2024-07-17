# frozen_string_literal: true

require_relative "publishing_platform_schemas/version"
require_relative "publishing_platform_schemas/schema"

module PublishingPlatformSchemas
  def self.content_schema_dir=(path_to_schemas)
    @content_schema_dir = path_to_schemas
  end

  def self.content_schema_dir
    @content_schema_dir ||= ENV.fetch("PUBLISHING_PLATFORM_CONTENT_SCHEMAS_PATH", "../publishing-api/content_schemas")
  end

  # @private
  class InvalidContentGenerated < RuntimeError
  end
end
