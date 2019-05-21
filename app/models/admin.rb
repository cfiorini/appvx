class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :omniauthable, :registrable
  devise :database_authenticatable, :lockable, :timeoutable, :trackable,
         :recoverable, :rememberable, :validatable
end
