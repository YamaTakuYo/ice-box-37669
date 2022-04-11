class CreateProcedures < ActiveRecord::Migration[6.0]
  def change
    create_table :procedures do |t|
      t.references :recipe,        null: false, foreign_key: true
      t.text      :name,    null: false
      t.timestamps
    end
  end
end
