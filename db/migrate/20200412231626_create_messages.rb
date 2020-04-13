class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.string :user_token
      t.string :user_name

      t.timestamps
    end

    add_index :messages, :user_token, unique: true
    add_index :messages, :user_name, unique: true
  end
end
