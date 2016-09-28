class User < ActiveRecord::Base
  scope :all_except, ->(u) { where.not(id: u) }
  devise :database_authenticatable, :registerable, :trackable, :validatable
  has_many :logged_games

  validates :name, presence: true
  validates :email, presence: true, format: { with: Devise.email_regexp }

end
