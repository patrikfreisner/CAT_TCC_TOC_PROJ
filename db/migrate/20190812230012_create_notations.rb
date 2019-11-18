class CreateNotations < ActiveRecord::Migration[5.2]
  def change
    create_table :notations do |t|
      t.string :name
      t.string :resource
      t.references :compound, foreign_key: true
      t.references :can_handle
      t.references :can_produce
      t.boolean :is_constraint
      t.string :bpm_notation_code
      t.references :diagram

      t.timestamps
    end

    add_foreign_key :notations, :information, column: :can_handle_id, primary_key: :id
    add_foreign_key :notations, :information, column: :can_produce_id, primary_key: :id
    
  end
end
