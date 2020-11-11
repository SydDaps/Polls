class CreateVoters < ActiveRecord::Migration[6.0]
  def change
    create_table :voters, id: :uuid do |t|
      t.string :email
      t.references :poll, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
