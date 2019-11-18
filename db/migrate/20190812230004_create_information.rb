class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.string :time
      t.string :quantity
      t.references :resource, foreign_key: true

      t.timestamps
    end
  end
end
