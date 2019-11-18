class CreateRelatedNotations < ActiveRecord::Migration[5.2]
  def change
    create_table :related_notations do |t|
      t.integer :notation_id
      t.integer :related_notation_id

      t.timestamps
    end
  end
end
