class User < ActiveRecord::Base
  before_validation :compute_default_name

  scope :all_except, ->(u) { where.not(id: u) }
  devise :database_authenticatable, :registerable, :trackable, :validatable
  has_many :logged_games

  validates :name, presence: true
  validates :email, presence: true, format: { with: Devise.email_regexp }

  def compute_default_name
    self.name = self.email.split("@").first
  end

end
