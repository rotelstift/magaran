class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :comic_chapter_id, null: false
      t.boolean :loved, null: false
      t.text :impression, null: false, default: ""

      t.timestamps null: false
    end
  end
end
