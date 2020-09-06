class Teacher < User
  has_many :students, :through => :class_room
  validates_uniqueness_of :class_room_id
end