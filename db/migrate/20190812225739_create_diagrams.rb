class CreateDiagrams < ActiveRecord::Migration[5.2]
  def change
    create_table :diagrams do |t|
      t.string :name
      t.text :bpm_diagram_code
      t.float :constraint_limit

      t.timestamps
    end
  end
end
