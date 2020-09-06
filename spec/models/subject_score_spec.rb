require 'rails_helper'
require_relative 'model_validators'

RSpec.describe SubjectScore, type: :model do

  subject do
    class_room = ClassRoom.new(standard: "VII")
    student = Student.new(class_room: class_room)
    scorecard = Scorecard.new(student: student)
    SubjectScore.new(score: 50, scorecard: scorecard)
  end

  it_should_behave_like "model validators", {score: nil}

  it("is invalid with score lesser than 0") do
    subject_score = SubjectScore.new(score: -10)
    expect(subject_score).to be_invalid
  end

  it("is invalid with score greater than 100") do
    subject_score = SubjectScore.new(score: 101)
    expect(subject_score).to be_invalid
  end
end