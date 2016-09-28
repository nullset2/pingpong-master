class User < ActiveRecord::Base
  scope :all_except, ->(u) { where.not(id: u) }
  devise :database_authenticatable, :registerable, :trackable, :validatable
  has_many :logged_games
end
