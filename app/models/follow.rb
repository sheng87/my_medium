class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :following, foreign_key: 'following_id', class_name: 'User'
end
