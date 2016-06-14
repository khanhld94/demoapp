class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :body, presence: true, length: { maximum: 140 }
  validates :title, presence: true, length: {minimum: 1, maximum: 20}
end
