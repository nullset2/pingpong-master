class AddRankingToUser < ActiveRecord::Migration
  def change
    add_column :users, :ranking, :integer
  end
end
