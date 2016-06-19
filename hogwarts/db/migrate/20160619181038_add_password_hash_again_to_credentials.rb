class AddPasswordHashAgainToCredentials < ActiveRecord::Migration
  def change
    add_column :credentials, :passwordHashAgain, :string
  end
end
