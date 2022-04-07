class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image

  with_options presence: true do
    validates :user
    validates :name
    validates :ingredient
    validates :seasoning
    validates :procedure
  end

end