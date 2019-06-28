class AddTypeToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :message_type, :string
    add_column :messages, :image, :string
  end
end
