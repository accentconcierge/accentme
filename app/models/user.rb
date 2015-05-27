class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :name, :phone_number, :country_code, :password, :password_confirmation
 

  validates :email, :phone_number, presence: true, uniqueness: true
  validates :name, :country_code, presence: true


end
