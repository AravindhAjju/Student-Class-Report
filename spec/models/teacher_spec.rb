require 'rails_helper'
require_relative 'model_validators'


RSpec.describe Teacher, type: :model do
  subject do
    class_room = ClassRoom.create standard: "VIII"
    teacher = class_room.build_teacher
  end

  it_should_behave_like "model validators", {class_room_id: nil}

  it "is invalid if the class already has a teacher" do
    class_room = ClassRoom.create standard: "I"
    teacher = class_room.create_teacher
    dup_teacher = teacher.dup
    expect(dup_teacher).to be_invalid
  end
end