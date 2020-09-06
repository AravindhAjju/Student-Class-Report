class ClassRoom < ApplicationRecord
  has_one :teacher
  has_many :students

  validates_presence_of :standard
end