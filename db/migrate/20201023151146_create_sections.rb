class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections, id: :uuid do |t|
      t.string :description
      t.references :poll, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
