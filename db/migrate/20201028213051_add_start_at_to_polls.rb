class AddStartAtToPolls < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :start_at, :timestamp
    add_column :polls, :end_at, :timestamp

  end
end
