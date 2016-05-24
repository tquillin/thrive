class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true #Micropost validation test/models/micropost_test.rb
  validates :content, presence: true, length: {maximum: 140}
end
