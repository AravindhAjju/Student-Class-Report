require 'rails_helper'
RSpec.describe ClassRoomReport do
  describe "generate student report" do
    it("raises error on invalid arguments") do
      expect do
        described_class.students_report
      end.to raise_error(ArgumentError)
    end

    it("raises error on passing empty teacher") do
      expect do
        described_class.students_report(teacher: nil)
      end.to raise_error("Invalid Teacher")
    end

    it("raises error on no student record found") do
      expect do
        class_room = ClassRoom.new(standard: "VII")
        teacher = Teacher.new(class_room: class_room)
        described_class.students_report(teacher: teacher)
      end.to raise_error("No Details Found")
    end

    it("verifies whether the output file is created") do      
      class_room = ClassRoom.create!(standard: "VII")
      teacher = class_room.create_teacher!
      StudentScoreCardFactory.update_student_scorecard_details(teacher, [{
        identity: "51",
        subject_scores: [{name: "S1", score: "10"}, {name: "S2", score: "20"}, {name: "S3", score: "30"}, {name: "S4", score: "40"}]
      }])

      expect(Pathname(described_class.students_report(teacher: teacher, in_file: true))).to exist
    end
  end
end
