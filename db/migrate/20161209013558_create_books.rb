class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.references :category, foreign_key: true
      t.string :title
      t.string :author
      t.float :avg_rate
      t.datetime :publish_date
      t.integer :page
      t.timestamps
    end
  end
end
