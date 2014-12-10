class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :mobile1
      t.string :mobile2
      t.integer :phone_no
      t.string :email
      t.timestamps
    end
  end
end
