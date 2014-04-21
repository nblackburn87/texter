class AddNumberColumn < ActiveRecord::Migration
  def change
    add_column :contacts, :number, :string
  end
end
