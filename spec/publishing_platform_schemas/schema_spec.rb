require "spec_helper"

RSpec.describe PublishingPlatformSchemas::Schema do
  describe ".find" do
    it "returns a frontend schema by name" do
      expect(PublishingPlatformSchemas::Schema.find(frontend_schema: "answer")).to be_a(Hash)
    end

    it "returns a links schema schema by name" do
      expect(PublishingPlatformSchemas::Schema.find(links_schema: "answer")).to be_a(Hash)
    end

    it "returns a publisher schema schema by name" do
      expect(PublishingPlatformSchemas::Schema.find(publisher_schema: "answer")).to be_a(Hash)
    end
  end

  describe ".all" do
    subject { PublishingPlatformSchemas::Schema.all }

    it "returns all Publishing Platform schemas" do
      expect(subject).to be_a(Hash)
    end
  end

  describe ".schema_names" do
    it "returns all schema names" do
      schema_names = PublishingPlatformSchemas::Schema.schema_names

      expect(schema_names).to be_a(Array)
      expect(schema_names.size > 3).to eql(true)
    end
  end
end
