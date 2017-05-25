class AddNameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :name, :string, limit: 50
  end
end
