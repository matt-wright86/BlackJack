class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :game_id
      t.boolean :player

      t.timestamps null: false
    end
  end
end
