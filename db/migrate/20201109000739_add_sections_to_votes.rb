class AddSectionsToVotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :votes, :section, null: false, foreign_key: true, type: :uuid
    add_reference :votes, :poll, null: false, foreign_key: true, type: :uuid
  end
end
