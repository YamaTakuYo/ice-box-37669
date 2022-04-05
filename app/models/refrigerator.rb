class Refrigerator < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :user
    validates :food
    validates :ex_date
    validates :category_id
  end

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
