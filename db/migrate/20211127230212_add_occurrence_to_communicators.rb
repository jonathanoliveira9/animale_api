class AddOccurrenceToCommunicators < ActiveRecord::Migration[6.1]
  def change
    add_column :communicators, :occurrence, :string, null: false
  end
end
