require 'rails_helper'
require_relative 'model_validators'

RSpec.describe Scorecard, type: :model do
  subject_scores = [{score: 10}, {score: 20},{score: 20},{score: 20}]

  subject do
    class_room = ClassRoom.new(standard: "VII")
    student = Student.new(class_room: class_room)

    Scorecard.new({
      subject_scores_attributes: [{score: 10}, {score: 20},{score: 20},{score: 20}],
      student: student
    })
  end

  it_should_behave_like "model validators", {subject_scores: []}

  it("is not valid without 4 subject score entries") do
    subject.subject_scores = subject.subject_scores[0..2]
    expect(subject).to be_invalid
  end

  it("is invalid when subject score as invalid") do
    subject.subject_scores[0][:score] = -10
    expect(subject).to be_invalid
  end

  it("has total equals to subject scores") do
    subject.save!
    expect(subject.total).to eq subject_scores.map{|subject_score| subject_score[:score]}.sum
  end
  
  it("has valid grade based on total") do
    subject.save!
    expect(subject.grade).to eq 'C'
  end
end