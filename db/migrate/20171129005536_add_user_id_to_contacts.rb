class AddUserIdToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :contact_id, :integer
  end
end
