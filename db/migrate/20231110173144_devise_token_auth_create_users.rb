class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[7.0]
  def change
    # Add new fields to the existing users table
    change_table :users do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Tokens
      t.json :tokens
    end

    # Ensure you don't create duplicate indices if they already exist
    unless index_exists?(:users, :email)
      add_index :users, :email, unique: true
    end
    unless index_exists?(:users, [:uid, :provider])
      add_index :users, [:uid, :provider], unique: true
    end
  end
end
