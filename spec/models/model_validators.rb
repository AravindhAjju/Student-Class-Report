RSpec.shared_examples "model validators" do |validation_attrs|
  context "Attribute validations" do
    it("is valid with valid attributes") do
      expect(subject).to be_valid
    end

    validation_attrs.each do |attr_name, val|
      it("is invalid with #{attr_name} as #{val.inspect}") do
        subject.send("#{attr_name}=", val)
        expect(subject).to be_invalid
      end
    end
  end
end