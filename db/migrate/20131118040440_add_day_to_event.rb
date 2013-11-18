class AddDayToEvent < ActiveRecord::Migration
  def change
    add_column :events, :day, :string
  end
end
