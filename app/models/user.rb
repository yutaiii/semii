class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true
  validates :password, presence: true, on: :edit!
  validates :faculty_id, presence: true
  validates :department_id, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_one :seminar
  has_one :department
  has_one :faculty
  def email_required?
    false
  end
  def password_required?
    false
  end
end
