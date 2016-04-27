class Person < ActiveRecord::Base
  validates :first_name, :last_name, :bio, :email, :linkedin, :twitter, :title,
  :snippet, :header_pic, :profile_pic, :skill_one, :skill_one_icon,
  :skill_one_blurb, :skill_two, :skill_two_icon, :skill_two_blurb, :skill_three,
  :skill_three_icon, :skill_three_blurb, presence: true
end
