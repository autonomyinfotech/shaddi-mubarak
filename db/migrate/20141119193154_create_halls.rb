class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.string :name
      t.text :address
      t.string :phone_no
      t.string :language
      t.attachment :image

      t.timestamps
    end
  end
end
