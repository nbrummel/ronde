class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :invited_user_id
      t.integer :event_id
      t.string :status
      t.datetime :accepted_at
      t.timestamps
    end
  end
end
