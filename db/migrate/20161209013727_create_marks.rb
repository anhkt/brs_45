class CreateMarks < ActiveRecord::Migration[5.0]
  def change
    create_table :marks do |t|
      t.references :user
      t.references :book
      t.integer :mark_read
      t.boolean :favorite
      t.timestamps
    end
  end
end
