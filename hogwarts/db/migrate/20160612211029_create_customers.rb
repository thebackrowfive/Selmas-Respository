class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :lastName
      t.string :firstName
      t.string :middleName
      t.string :gender
      t.date :customerRegistrationDate

      t.timestamps null: false
    end
  end
end
