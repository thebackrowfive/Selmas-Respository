class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :emailType
      t.string :email
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
