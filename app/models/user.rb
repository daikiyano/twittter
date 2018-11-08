class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    mount_uploader :image, ImagesUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :tweeets, dependent: :destroy
         has_many :comments, dependent: :destroy

end
