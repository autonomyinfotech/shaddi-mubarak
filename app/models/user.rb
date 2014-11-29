class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :hall
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, uniqueness: true
  validates_length_of :username, within: 6..20
  validates_format_of :username, with: /\A[a-zA-Z0-9]+\Z/
  validates_length_of [:first_name, :last_name], maximum: 20
  validates_format_of [:first_name, :last_name], with: /\A[a-zA-Z]+\Z/
  before_save :assign_role

  scope :user_list, -> { includes(:hall).all }
  scope :all_users, ->(u) { u.admin ? user_list : u.hall.users }

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def language
    hall.language if hall
  end

  def hall_logo
    hall.image if hall
  end

  def hall_name
    hall.name.capitalize if hall
  end

  def role
    if admin
      'Admin'
    else
      'User'
    end
  end

  def create_hall
    hall = Hall.default
    update(hall_id: hall.id)
  end

  private

  def assign_role
    self.admin = true if User.count == 0
  end
end
