class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :customers
  has_many :suppliers
  has_many :products
  has_many :purchases 
  has_many :sales 
  has_many :managers
end
