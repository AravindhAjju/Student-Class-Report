require 'rails_helper'
require_relative 'model_validators'

RSpec.describe Student, type: :model do
  subject do
    class_room = ClassRoom.new(standard: "VII")
    Student.new(class_room: class_room, identity: "1")
  end

  it_should_behave_like "model validators", {identity: nil}

  it("is invalid with duplicate identity") do
    class_room = ClassRoom.new(standard: "VII")
    identity_arr = [
      { identity: 1, class_room: class_room},
      { identity: 2, class_room: class_room},
      { identity: 1, class_room: class_room}
    ]
    expect do 
      Student.create!(identity_arr)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
end
