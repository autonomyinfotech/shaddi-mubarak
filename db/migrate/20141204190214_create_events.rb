class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.references :event_type, index: true
      t.references :customer, index: true
      t.timestamps
    end
  end
end
