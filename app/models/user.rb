class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

      mount_uploader :image, ImagesUploader
        has_one_attached :avatar
          devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
          has_many :tweeets, dependent: :destroy
          has_many :comments, dependent: :destroy

         has_many :active_relationships, class_name: "Relationship",  foreign_key: "follower_id",dependent: :destroy
         has_many :following, through: :active_relationships, source: :followed

         has_many :passive_relationships, class_name: "Relationship",foreign_key: "followed_id", dependent:   :destroy
         has_many :followers, through: :passive_relationships, source: :follower


         def follow(other_user)
           following << other_user
         end

         def unfollow(other_user)
            active_relationships.find_by(followed_id: other_user.id).destroy
         end
            # 現在のユーザーがフォローしてたらtrueを返す
         def following?(other_user)
            following.include?(other_user)
         end

         has_many :likes, dependent: :destroy

      def self.search(search)
        if search
          where(['username LIKE ?', "%#{search}%"])
        else
         all
        end
      end

end
