class Person < ActiveRecord::Base
  validates :first_name, :last_name, :bio, :email, :linkedin, :twitter, :title,
  :snippet, :header_pic, :profile_pic, :skill_one, :skill_one_icon,
  :skill_one_blurb, :skill_two, :skill_two_icon, :skill_two_blurb, :skill_three,
  :skill_three_icon, :skill_three_blurb, presence: true

  scope :active, -> { where(active: true) }
  scope :order_by_active, -> { order(:active => "desc" , :priority => "asc") }


  mount_uploader :profile_pic, AvatarUploader
  mount_uploader :header_pic, AvatarUploader
  mount_uploader :skill_one_icon, IconUploader
  mount_uploader :skill_two_icon, IconUploader
  mount_uploader :skill_three_icon, IconUploader

  def full_name
    "#{self.first_name} " + "#{self.last_name}"
  end

end
