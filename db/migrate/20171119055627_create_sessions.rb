class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
    	t.integer :user_id
      t.string :auth_token
      t.datetime :create_at
      t.timestamp :expires_at,:default => Time.now
      t.timestamps
    end
  end
end
