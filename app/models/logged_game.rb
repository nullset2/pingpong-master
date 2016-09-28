class LoggedGame < ActiveRecord::Base
  after_create :update_player_rankings
  belongs_to :user
  belongs_to :opponent, class_name: "User"

  validates :user_score, presence: true, numericality: { less_than_or_equal_to: 21 }
  validates :opponent_score, presence: true, numericality: { less_than_or_equal_to: 21 }
  validates :opponent_id, presence: true
  validate :match_has_a_winning_score

  def match_has_a_winning_score
    return true if ((self.user_score - self.opponent_score).abs >= 2 ) && (self.user_score == 21 || self.opponent_score == 21)
    errors.add(:base, "Submitted scores are invalid, please check your input data")
    false
  end

  def status
    return "W" if self.user_score == 21
    "L"
  end

  def update_player_rankings
    k_value = 32

    player1 = User.find_by(id: self.user_id)
    player2 = User.find_by(id: self.opponent_id)

    player1_ranking = player1.ranking
    player2_ranking = player2.ranking

    self.status == "W" ? player1_result = 1 : player1_result = 0
    player2_result = 1 - player1_result

    player1_expectation = 1/(1+10**((player2_ranking - player1_ranking)/400.0))
    player2_expectation = 1/(1+10**((player1_ranking - player2_ranking)/400.0))

    self.user.ranking = (player1_ranking + k_value * (player1_result - player1_expectation)).round
    self.opponent.ranking = (player2_ranking + k_value * (player2_result - player2_expectation)).round

    byebug
  end

end
