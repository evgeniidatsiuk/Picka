class Image < ApplicationRecord
  belongs_to :user
  has_many :likes

  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON # If you use SQLite, add this line.
end
