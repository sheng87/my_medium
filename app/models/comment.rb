class Comment < ApplicationRecord
  acts_as_paranoid 

  belongs_to :user
  belongs_to :story

  validates :content,presence: true
end
