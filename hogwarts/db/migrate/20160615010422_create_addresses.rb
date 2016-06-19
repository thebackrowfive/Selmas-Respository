class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :streetNumber
      t.string :streetName
      t.string :city
      t.string :provinceOrState
      t.string :postalCode
      t.string :other
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
