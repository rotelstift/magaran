class AddEmotionsToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :fan, :boolean
    add_column :votes, :tears, :boolean
    add_column :votes, :laugh, :boolean
    add_column :votes, :cool, :boolean
  end
end
