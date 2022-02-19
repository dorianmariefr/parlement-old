class CreateRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :relations do |t|
      t.references :from, null: false, foreign_key: { to_table: :people }
      t.references :to, null: false, foreign_key: { to_table: :people }
      t.string :kind, null: false

      t.timestamps
    end
  end
end
