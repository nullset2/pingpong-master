class User < ActiveRecord::Base
  before_validation :set_initial_ranking
  before_validation :compute_default_name

  scope :all_except, ->(u) { where.not(id: u) }
  devise :database_authenticatable, :registerable, :trackable, :validatable
  has_many :logged_games

  validates :name, presence: true
  validates :email, presence: true, format: { with: Devise.email_regexp }

  def set_initial_ranking
    self.ranking = 0
  end

  def compute_default_name
    self.name = self.email.split("@").first
  end

  def games_played
    LoggedGame.where("user_id = #{self.id} or opponent_id = #{self.id}").all.count
  end

end
