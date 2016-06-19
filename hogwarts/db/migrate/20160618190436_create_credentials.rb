class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.string :userName
      t.string :password_digest
      t.string :passQuestion
      t.string :passQuestionAnswerHash
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
