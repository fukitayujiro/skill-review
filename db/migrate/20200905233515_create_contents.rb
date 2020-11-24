class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.integer :media_id
      t.integer :genre_id
      t.string :introduction
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
