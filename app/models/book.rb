class Book < ApplicationRecord
  
  has_one_attached :profile_image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :iines, dependent: :destroy

  validates :title,presence: true
  validates :body,presence: true, length: {maximum:200}
  
   def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path),filename:'default-image.jpg',content_type:'image/jpeg')
    end
    image
   end
   
   def iined_by?(user)
    iines.exists?(user_id: user.id)
   end
end