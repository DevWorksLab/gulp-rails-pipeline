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

  def self.import_csv
    file = File.open Rails.root.join('motivatepeople.csv')
    CSV.foreach file.path do |row|
      unless row[0] == "id"
        first_name = row[1]
        last_name = row[2]
        bio = row[3]
        email = row[4]
        linkedin row[5]
        twitter = row[6]
        title = row[7]
        snippet = row[8]
        skill_one = row[9]
        skill_one_blurb = row[10]
        skill_two = row[11]
        skill_two_blurb = row[12]
        skill_three = row[13]
        skill_three_blurb = row[14]
        priority = row[17]
        active = row[18]
        Person.create(
          first_name: first_name,
          last_name: last_name,
          bio: bio,
          email: email,
          linkedin: linkedin,
          twitter: twitter,
          title: title,
          snippet: snippet,
          skill_one: skill_one,
          skill_one_blurb: skill_one_blurb,
          skill_two: skill_two,
          skill_two_blurb: skill_two_blurb,
          skill_three: skill_three,
          skill_three_blurb: skill_three_blurb,
          priority: priority,
          active: active
        )
      end
    end
  end

end
