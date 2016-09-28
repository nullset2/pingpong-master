class LoggedGame < ActiveRecord::Base
  belongs_to :user
  belongs_to :user, foreign_key: :opponent_id, class_name: "User"
end
