class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.references :user,        null: false, foreign_key: true
      t.string     :name,        null: false
      t.integer    :ingredient, null: false
      t.integer    :seasoning,        null: false
      t.integer    :procedure, null: false

      t.timestamps
    end
  end
end
