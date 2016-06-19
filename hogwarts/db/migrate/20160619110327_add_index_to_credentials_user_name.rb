class AddIndexToCredentialsUserName < ActiveRecord::Migration


 def change

   add_index :credentials, :userName, unique: true
 end

end
