class CreateCommunicators < ActiveRecord::Migration[6.1]
  def change
    create_table :communicators do |t|
      t.string :name
      t.string :phone
      t.integer :animal_id

      t.timestamps
    end
  end
end
