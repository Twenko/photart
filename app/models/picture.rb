class Picture < ActiveRecord::Base
  attr_accessible :gallery_id, :user_id, :name, :description, :size, :image, :remote_image_url
  belongs_to :gallery
  mount_uploader :image, ImageUploader
end
