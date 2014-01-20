class Picture < ActiveRecord::Base
  attr_accessible :gallery_id, :user_id, :name, :description, :size, :image, :remote_image_url, :user, :gallery, :admin
  belongs_to :gallery
  belongs_to :user
  belongs_to :admin
  mount_uploader :image, ImageUploader
  validate :image_size
  
  def image_size
    if image.file.size.to_f/(1000*1000) > 10.to_f
      errors.add(:image, "Image trop grande (> 10 mo)")
    end
  end
  
end
