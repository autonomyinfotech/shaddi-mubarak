class CreateOutsources < ActiveRecord::Migration
  def change
    create_table :outsources do |t|
      t.string :name
      t.string :mobile1
      t.string :mobile2
      t.integer :phone
      t.string :email
      t.references :service, index: true
      t.timestamps
    end
  end
end
