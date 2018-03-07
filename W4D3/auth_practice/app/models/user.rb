# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  attr_reader :password

  validates :username, presence: true
  validates :password_digest,
            presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 8 }, allow_nil: true
  before_validation do
    ensure_session_token
  end

  def self.find_by_credentials(username, password)
    user = find_by(username: username)
    bcrypt_pass = BCrypt::Password.new(user.password_digest)
    bcrypt_pass.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = nil
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
