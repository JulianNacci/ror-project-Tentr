class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates_presence_of :restaurant_id, :content, :rating
  validates_inclusion_of :rating, in: 0..5
  validates_numericality_of :rating, only_integer: true
end
