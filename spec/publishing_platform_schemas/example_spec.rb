require "spec_helper"

RSpec.describe PublishingPlatformSchemas::Example do
  describe ".find_all" do
    it "returns all the examples" do
      examples = PublishingPlatformSchemas::Example.find_all("answer")

      puts examples
      expect(examples).to be_a(Array)
      expect(!examples.empty?).to eql(true)
    end
  end

  describe ".find" do
    it "returns one example" do
      example_content_item = PublishingPlatformSchemas::Example.find("answer", example_name: "answer")

      expect(example_content_item).to be_a(Hash)
    end
  end

  describe ".examples_path" do
    let(:in_examples) { false }
    let(:schema_name) { "call_for_evidence" }
    before do
      allow(Dir)
        .to receive(:exist?)
        .with("#{PublishingPlatformSchemas.content_schema_dir}/examples")
        .and_return(in_examples)
    end

    subject { described_class.examples_path(schema_name) }

    context "when schema examples are in /examples" do
      let(:in_examples) { true }
      it { is_expected.to eq "#{PublishingPlatformSchemas.content_schema_dir}/examples/#{schema_name}/frontend" }
    end

    context "when schema examples are not in /examples" do
      let(:in_examples) { false }
      it { is_expected.to eq "#{PublishingPlatformSchemas.content_schema_dir}/formats/#{schema_name}/frontend/examples" }
    end
  end
end
