class Hall < ActiveRecord::Base
  has_many :users
  validates :phone_no, numericality: true, allow_blank: true
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

end
