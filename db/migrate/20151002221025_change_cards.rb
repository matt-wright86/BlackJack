class ChangeCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.string :suit
      t.string :name
      t.integer :value
      t.integer :game_id
      t.integer :hand_id
    end
  end
end
