class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.string :name
      t.text :address
      t.string :phone_no
      t.string :hall_type
      t.string :no_of_floors
      t.string :hall_capacity
      t.string :language
      t.attachment :image

      t.timestamps
    end
  end
end
