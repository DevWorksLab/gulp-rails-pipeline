class Person < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  # :bio, :linkedin, :twitter, :title,
  # :snippet, :skill_one,
  # :skill_one_blurb, :skill_two, :skill_two_blurb, :skill_three,
  # :skill_three_blurb, presence: true

  scope :active, -> { where(active: true).order("priority asc") }
  scope :order_by_active, -> { order(:active => "desc" , :priority => "asc") }


  mount_uploader :profile_pic, AvatarUploader
  mount_uploader :header_pic, AvatarUploader
  mount_uploader :other_image, AvatarUploader
  mount_uploader :skill_one_icon, IconUploader
  mount_uploader :skill_two_icon, IconUploader
  mount_uploader :skill_three_icon, IconUploader

  extend FriendlyId
  friendly_id :first_name, use: [:slugged, :finders]

  def full_name
    "#{self.first_name} " + "#{self.last_name}"
  end

end
