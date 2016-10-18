class User < ActiveRecord::Base

  has_secure_password

  has_many :orders
  has_many :reviews

  validates :name, presence: true
  validates :email, presence: true, :uniqueness => true , case_sensitive: false
  validates :password_digest, presence: true
  validates_length_of :password_digest, minimum: 3, on: :create

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    return user && user.authenticate(password)
  end

end
