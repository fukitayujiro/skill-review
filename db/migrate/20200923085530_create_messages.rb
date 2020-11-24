class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :point
      t.text :text
      t.references :user
      t.references :content
      t.timestamps
    end
  end
end
