class LoggedGame < ActiveRecord::Base
  belongs_to :user
  belongs_to :opponent, class_name: "User"

  validates :user_score, numericality: { less_than_or_equal_to: 21 }
  validates :opponent_score, numericality: { less_than_or_equal_to: 21 }
  validate :match_has_a_winning_score

  def match_has_a_winning_score
    (self.user_score - self.opponent_score >= 2 ) && (self.user_score == 21 || self.opponent_score == 21) ? true : false
  end

end
