class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true
  validates :password, presence: true
  validates :faculty_id, presence: true
  validates :department_id, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
def email_required?
  false
end
def password_required?
  false
end
end
