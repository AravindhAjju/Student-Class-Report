class Scorecard < ApplicationRecord
  belongs_to :student, inverse_of: :scorecard
  has_many :subject_scores, dependent: :destroy, inverse_of: :scorecard

  validates_length_of :subject_scores, is: 4, wrong_length: "Need %{count} score entries"

  accepts_nested_attributes_for :subject_scores

  before_save :set_total
  before_save :set_grade
  
  private

    def set_total
      self.total = subject_scores.map(&:score).sum
    end

    def set_grade
      self.grade = if total >= 340
        'A'
      elsif total >= 300
        'B'
      else
        'C'
      end
    end
end
