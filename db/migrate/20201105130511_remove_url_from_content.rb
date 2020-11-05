class RemoveUrlFromContent < ActiveRecord::Migration[6.0]
  def change
    remove_column :contents, :url, :string
  end
end
