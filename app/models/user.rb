class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :comments
  has_many :likes

  validates :Name, presence: true
  validates :PostsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_save :assign_role

  def recent_posts
    posts.order(created_at: :desc).last(3)
  end

  def admin?
    role == 'admin'
  end

  def assign_role
    self.role = 'user' if role.nil?
  end
end
