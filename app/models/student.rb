class Student < User
  has_one :scorecard, dependent: :destroy, inverse_of: :student
  validates_presence_of :identity

  delegate :grade, :total, to: :scorecard, allow_nil: true
end