class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :roles
  has_many :comments, dependent: :destroy

  validates :name, presence: true

  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end

  def has_role?(role)
    roles.any? { |i| i[:name] == role.to_s }
  end

  def admin?
    has_role?(:admin)
  end
end
