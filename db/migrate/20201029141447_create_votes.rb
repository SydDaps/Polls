class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes, id: :uuid do |t|
      t.references :option, null: false, foreign_key: true, type: :uuid
      t.references :voter, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
