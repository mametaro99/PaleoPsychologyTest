class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :min_score, null: false
      t.integer :max_score, null: false
      t.float :avg_score

      t.timestamps
    end
  end
end
