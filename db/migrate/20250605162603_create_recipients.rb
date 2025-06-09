class CreateRecipients < ActiveRecord::Migration[8.0]
  def change
    create_table :recipients do |t|
      t.references :private_message, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
