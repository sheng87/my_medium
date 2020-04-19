class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
   # validations
   validates :username, presence: true, uniqueness: true 
  
   #relationships
   has_many :stories
   has_many :follows
   has_many :bookmarks      
   has_one_attached :avatar #mini_magick
   
   # instance method
   def bookmark?(story)
      bookmarks.exists?(story: story) 
   end

   def bookmark!(story)
    if bookmark?(story)
      bookmarks.find_by(story: story).destroy
      return "Unbookmarked"
    else
      bookmarks.create(story: story)
      return "Bookmarked"
    end    
   end 

   def follow?(user)
      follows.exists?(following: user)
   end

   def follow!(user)
      if follow?(user)
        follows.find_by(following: user).destroy
        return 'Follow'
      else
        follows.create(following: user)
        return 'Followed'  
      end  
   end


 end

