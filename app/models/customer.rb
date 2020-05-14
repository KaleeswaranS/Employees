class Customer < ApplicationRecord


# devise :database_authenticatable, :registerable,
# 	     :recoverable, :rememberable, :trackable,
# 	     :validatable, :email_regexp =>  /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\Z/i

  # attr_accessor :password
  EMAIL_REGEX = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\Z/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create

  # attr_accessor :username, :email, :password, :confirm_password
  # has_secure_password
end
