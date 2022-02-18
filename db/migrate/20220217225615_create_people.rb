class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.references :user, null: false, foreign_key: true
      t.string :given_name, null: false
      t.string :family_name

      t.timestamps
    end
  end
end
