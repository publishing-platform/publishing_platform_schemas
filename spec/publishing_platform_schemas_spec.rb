# frozen_string_literal: true

RSpec.describe PublishingPlatformSchemas do
  around :each do |example|
    # resets content schema directory before and after each test so that these tests do not affect other tests' state
    PublishingPlatformSchemas.content_schema_dir = nil
    example.run
    PublishingPlatformSchemas.content_schema_dir = nil
  end

  it "has a version number" do
    expect(PublishingPlatformSchemas::VERSION).not_to be nil
  end

  describe "PublishingPlatformSchemas" do
    describe ".content_schema_dir" do
      it "can be manually set" do
        described_class.content_schema_dir = "/manually/set/path"
        expect(described_class.content_schema_dir).to eql("/manually/set/path")
      end

      it "can be set via the PUBLISHING_PLATFORM_CONTENT_SCHEMAS_PATH env variable when no path has been manually set" do
        ClimateControl.modify PUBLISHING_PLATFORM_CONTENT_SCHEMAS_PATH: "/env/var/path" do
          expect(described_class.content_schema_dir).to eql("/env/var/path")
        end
      end

      it "uses the manually set variable over an environment variable" do
        ClimateControl.modify PUBLISHING_PLATFORM_CONTENT_SCHEMAS_PATH: "/env/var/path" do
          described_class.content_schema_dir = "/manually/set/path"
          expect(described_class.content_schema_dir).to eql("/manually/set/path")
        end
      end

      it "uses the default path if no manually configured or env variable path has been set" do
        ClimateControl.modify PUBLISHING_PLATFORM_CONTENT_SCHEMAS_PATH: nil do
          expect(described_class.content_schema_dir).to eql("../publishing-api/content_schemas")
        end
      end
    end
  end
end
