class AddCreaterIdToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :creater_id, :integer
    add_foreign_key :events, :users, column: :creater_id
  end
end
