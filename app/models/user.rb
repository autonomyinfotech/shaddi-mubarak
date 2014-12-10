class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_length_of [:first_name, :last_name], maximum: 20
  validates_format_of [:first_name, :last_name], with: /\A[a-zA-Z]+\Z/
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def hall_name
    hall.name.capitalize if hall
  end
end
