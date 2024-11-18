class AddDefaultToUsersIsOwner < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :is_owner, :boolean, default: false
  end
end
