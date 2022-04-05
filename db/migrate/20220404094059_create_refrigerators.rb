class CreateRefrigerators < ActiveRecord::Migration[6.0]
  def change
    create_table :refrigerators do |t|
      t.references :user,        null: false, foreign_key: true
      t.string     :food,        null: false
      t.integer    :category_id, null: false
      t.datetime   :ex_date,     null:false
      t.text       :remarks
      t.timestamps
    end
  end
end
