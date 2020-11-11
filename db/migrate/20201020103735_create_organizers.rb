class CreateOrganizers < ActiveRecord::Migration[6.0]
  def change
    create_table :organizers, id: :uuid do |t|
      t.string :name 
      t.string :email
      t.string :access_token
      t.timestamps
    end
  end
end
