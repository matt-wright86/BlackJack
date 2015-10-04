class Addposition < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.integer :position
    end
  end
end
