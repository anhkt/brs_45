class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.integer :status, default: 0
      t.string :title
      t.datetime :publish_date
      t.string :author
      t.timestamps
    end
  end
end
