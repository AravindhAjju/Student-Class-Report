require 'rails_helper'
require_relative 'model_validators'
RSpec.describe ClassRoom, type: :model do
  subject do
    ClassRoom.new(standard: "VII")
  end
  it_should_behave_like "model validators", {standard: nil}
end
