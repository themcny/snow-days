class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, :phone, uniqueness: true

  has_many :favorites
  has_many :resorts, through: :favorites

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
