class ExternalLink < ActiveRecord::Base

  mount_uploader :image, AvatarUploader

end
