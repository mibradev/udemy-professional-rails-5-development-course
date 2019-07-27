class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :roles

  validates :name, presence: true

  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end
end
