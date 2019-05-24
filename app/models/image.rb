class Image < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
 has_many :comments, dependent: :destroy

  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON # If you use SQLite, add this line.
end
