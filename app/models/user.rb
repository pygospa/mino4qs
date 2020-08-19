class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, and :omniauthable
  devise :confirmable,
         :database_authenticatable,
         :lockable,
         :recoverable,
         :registerable,
         :rememberable,
         :trackable,
         :validatable
end
