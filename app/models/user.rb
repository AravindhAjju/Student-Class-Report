class User < ApplicationRecord
  belongs_to :class_room
  validates_presence_of :class_room_id
end
