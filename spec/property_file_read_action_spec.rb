describe Fastlane::Actions::PropertyFileWriteAction do
  describe '#run' do
    it 'prints a message' do
      properties = Fastlane::Actions::PropertyFileWriteAction.run(file: "example.properties")
      expect(properties).to include("VERSION")
      expect(properties["VERSION"]).to match("1.0.0")
    end
  end
end
