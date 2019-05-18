class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :images
  has_many :likes

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user)
   following << other_user
 end

 def unfollow(other_user)
   following.delete(other_user)
 end

 def following?(other_user)
   following.include?(other_user)
 end

 def feed
   r = Relationship.arel_table
   t = Image.arel_table
   sub_query = t[:user_id].in(r.where(r[:follower_id].eq(id)).project(r[:followed_id]))
   Image.where(sub_query.or(t[:user_id].eq(id)))
end

end
