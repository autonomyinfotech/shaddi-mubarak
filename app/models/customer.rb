class Customer < ActiveRecord::Base
  has_and_belongs_to_many :services

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def mobile
    "#{mobile1}, #{mobile2}"
  end
end
