class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :mentor_id
      t.integer :student_id
      t.date :date
      t.time :time
      t.string :location
      t.integer :sub_category_id

      t.timestamps
    end
    add_index :relationships, :mentor_id
    add_index :relationships, :student_id
    add_index :relationships, [:mentor_id, :student_id], unique: true

  end
end
