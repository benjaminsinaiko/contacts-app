class RenameContactIdInContacts < ActiveRecord::Migration[5.1]
  def change
    rename_column :contacts, :contact_id, :user_id
  end
end
