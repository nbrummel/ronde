class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :event_id
      t.string :status
      t.datetime :accepted_at

      t.timestamps
    end
  end

  def down
  	remove_column :attending
  end
end
