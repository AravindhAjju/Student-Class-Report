require 'rails_helper'
RSpec.describe StudentScoreCardFactory do
  describe "create student and subject scores" do
    it("raises error on invalid arguments") do
      expect do
        described_class.update_student_scorecard_details
      end.to raise_error(ArgumentError)
    end

    it("raises error on passing empty teacher") do
      expect do
        described_class.update_student_scorecard_details(teacher: nil)
      end.to raise_error("Invalid Teacher")
    end

    it("raises error on passing empty details") do
      expect do
        class_room = ClassRoom.create!(standard: "VI")
        teacher = class_room.create_teacher!        
        described_class.update_student_scorecard_details(teacher: teacher)
      end.to raise_error("Invalid Details")
    end

    it("raises error on invalid details") do
      expect do
        class_room = ClassRoom.create!(standard: "VI")
        teacher = class_room.create_teacher!
        StudentScoreCardFactory.update_student_scorecard_details(teacher: teacher, details: [
          {
            identity: "51",
            subject_scores: [{name: "S1", score: "10"}, {name: "S2", score: "-20"}, {name: "S3", score: "30"}, {name: "S4", score: "-40"}]
          }
        ])
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it("raises error on invalid input format in the file") do
      expect do
        class_room = ClassRoom.create!(standard: "VI")
        teacher = class_room.create_teacher!

        file = File.new("/tmp/invalid_test_file.txt", "w")
        file.puts "1-S1-20-S2-30-S3-40-S4-50-S5-60"
        file.close()

        StudentScoreCardFactory.update_student_scorecard_details(teacher: teacher, details: file)
      end.to raise_error("Invalid File Format")
    end

    it("verifies whether the details are created as provided") do
      class_room = ClassRoom.create!(standard: "XI")
      teacher = class_room.create_teacher!
      StudentScoreCardFactory.update_student_scorecard_details(teacher: teacher, details: [{
        identity: "51",
        subject_scores: [{name: "S1", score: "10"}, {name: "S2", score: "20"}, {name: "S3", score: "30"}, {name: "S4", score: "40"}]
      }])

      expect(class_room.students.count).to eq(1)
    end
  end
end