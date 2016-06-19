class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phoneNumberType
      t.string :phoneNumber
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
