class User < ActiveRecord::Base

  has_secure_password

  validates :email, uniqueness: true
  validates :password, :presence => true,
            :confirmation => true,
            :length => {:within => 6..40},
            on: :create

  def email=(value)
    value = value.strip.downcase
    write_attribute :email, value
  end

  has_one :cart
  has_many :orders

end
