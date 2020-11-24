class RemoveJudgeFromContent < ActiveRecord::Migration[6.0]
  def change
    remove_column :contents, :judge, :integer
  end
end
