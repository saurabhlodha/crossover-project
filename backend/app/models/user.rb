class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :generate_auth_token
  enum access_level: [:user, :agent, :admin] # :user_manager
  validates :auth_token, uniqueness: true
  has_many :requests

  def generate_auth_token
    begin
      self.auth_token = Devise.friendly_token
      self.expires_at = DateTime.now + 2.hours
    end while self.class.exists?(auth_token: auth_token)
  end

end
