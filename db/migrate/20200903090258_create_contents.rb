class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :media
      t.string :genre
      t.string :introduction
      t.string :url
      t.string :user_id
      t.string :judge
      t.timestamps
    end
  end
end
