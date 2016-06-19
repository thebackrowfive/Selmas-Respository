class AddPasswordHashToCredentials < ActiveRecord::Migration


  def change
    
   add_column :credentials, :passwordHash, :string
  
  end

end
