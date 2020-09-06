class SubjectScore < ApplicationRecord
  belongs_to :scorecard, inverse_of: :subject_scores
  
  validates :score, :inclusion => 1..100
end