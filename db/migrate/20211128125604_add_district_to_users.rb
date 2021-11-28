class AddDistrictToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :district, :string
  end
end
