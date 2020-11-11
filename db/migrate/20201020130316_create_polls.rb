class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls, id: :uuid do |t|
      t.references :organizer, null: false, foreign_key: true, type: :uuid
      t.string :title 
      t.string :description
      t.timestamps
    end
  end
end
