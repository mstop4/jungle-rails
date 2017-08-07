class User < ActiveRecord::Base

  has_secure_password

  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def authenticate_with_credentials(email, password)
    if user = User.find_by_email(email) && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
