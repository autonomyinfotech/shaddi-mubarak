class CreateCustomersServices < ActiveRecord::Migration
  def change
    create_table :customers_services do |t|
      t.references :customer, index: true
      t.references :service, index: true
      t.timestamps
    end
  end
end
