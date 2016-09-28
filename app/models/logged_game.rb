class LoggedGame < ActiveRecord::Base
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

end
