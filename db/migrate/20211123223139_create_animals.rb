class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :age
      t.string :extra_information
      t.integer :status
      t.integer :user_id

      t.timestamps
    end
  end
end
