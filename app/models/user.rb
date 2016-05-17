class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-\.{0,1}]+@[a-z\d\-\.{0,1}]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # def index
  #
  # end
  #
  # def new
  #
  # end
  #
  # def home
  #
  # end
  #
  # def about
  #
  # end


end