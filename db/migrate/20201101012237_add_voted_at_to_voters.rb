class AddVotedAtToVoters < ActiveRecord::Migration[6.0]
  def change
    add_column :voters, :voted_at, :timestamp
  end
end
