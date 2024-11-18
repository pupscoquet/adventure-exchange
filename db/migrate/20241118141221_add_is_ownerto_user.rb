class AddIsOwnertoUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_owner, :boolean
  end
end
