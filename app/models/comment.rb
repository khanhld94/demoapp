class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :entry
  validates :content, length: {minimum: 1 , maximum: 255}
end
