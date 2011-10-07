class DeviseCreateAdvertisers < ActiveRecord::Migration
  def self.up
    create_table(:advertisers) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.timestamps
      t.lockable
      # 
      t.string :name
      t.string :cnpj
      t.string :website_url
      t.string :xml_url
    end

    add_index :advertisers, :email,                :unique => true
    add_index :advertisers, :reset_password_token, :unique => true
    add_index :advertisers, :unlock_token,         :unique => true
    # add_index :advertisers, :confirmation_token,   :unique => true
    # add_index :advertisers, :authentication_token, :unique => true
  end
  def self.down
    drop_table :advertisers
  end
end