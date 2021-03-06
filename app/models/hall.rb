class Hall < ActiveRecord::Base
  validates :phone_no, numericality: true
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
end
