class AddUserIdToEvents < ActiveRecord::Migration
	def change
		create_table :events do |t|
			t.string :name
			t.string :location
			t.text :description
			t.string :event_type
			t.boolean :public
			t.datetime :start
			t.datetime :end
			t.belongs_to :created_by
			t.timestamps
		end
	end
end
