class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweeet
  validates :body, presence: true
end
