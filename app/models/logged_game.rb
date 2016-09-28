class LoggedGame < ActiveRecord::Base
  belongs_to :user
  belongs_to :opponent, class_name: "User"
end
