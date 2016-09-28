class CreateLoggedGames < ActiveRecord::Migration
  def change
    create_table :logged_games do |t|
      t.datetime :date_played
      t.integer :user_id
      t.integer :opponent_id
      t.integer :user_score
      t.integer :opponent_score

      t.timestamps null: false
    end
  end
end
