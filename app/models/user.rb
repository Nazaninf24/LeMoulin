class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  # Relationships
  has_one :profile , dependent: :destroy
  has_one :shop, class_name: 'Shop', foreign_key: 'shopkeeper_id', dependent: :destroy
  has_many :orders, dependent: :destroy
end
