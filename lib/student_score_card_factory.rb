class StudentScoreCardFactory
  attr_accessor :teacher

  def initialize teacher
    @teacher = teacher
  end

  def self.update_student_scorecard_details teacher:, details: []
    raise "Invalid Teacher" if teacher.blank?
    raise "Invalid Details" if details.blank?
    instance = self.new(teacher)

    details = get_details_from_file(details) if details.is_a?(File)
    instance.update_details details
  end

  def self.get_details_from_file(file)
    details = []
    file_text = File.open(file).read
    file_text.each_line do |line|
      det_arr = line.split(",")
      det = {}
      det[:identity] = det_arr[0]
      det[:subject_scores] = det_arr[1..-1].map do |subject_details|
        {
          name: subject_details.split('-')[0],
          score: subject_details.split('-')[1].strip.to_i
        }
      end

      raise "Invalid File Format" if det.map(&:blank?)
      details << det
    end
    details
  end

  def update_details(details=[])
    ActiveRecord::Base.transaction do
      details.each do |student_detail|
        student = self.teacher.class_room.students.create!(identity: student_detail[:identity])
        student.create_scorecard!({
          subject_scores_attributes: student_detail[:subject_scores]
        })
      end
    end
  end
end