class AmendContacts < ActiveRecord::Migration

  def down
   remove_column :contacts, :number
  end

  def up
    add_column :contacts, :number, :string
  end
end
