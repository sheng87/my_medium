module UsersHelper
  def avatar (user, size:250)
     image_tag user.avatar.variant(resize: "#{size}x#{size}"), class: 'user-avatar' if user.avatar.attached? 
  end
end

