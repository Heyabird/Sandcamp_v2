class AddUserIdToCollections2 < ActiveRecord::Migration[6.0]
  def change
    add_column :collections, :user_id, :integer
  end
end
