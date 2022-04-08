class CreateSeasonings < ActiveRecord::Migration[6.0]
  def change
    create_table :seasonings do |t|
      t.references :recipe,        null: false, foreign_key: true
      t.string    :name,    null: false
      t.timestamps
    end
  end
end
