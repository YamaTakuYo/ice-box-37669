class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  
  has_many :ingredients, dependent: :destroy
  has_many :seasonings, dependent: :destroy
  has_many :procedures, dependent: :destroy

  with_options presence: true do
    validates :user
    validates :name
  end

  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :seasonings, allow_destroy: true
  accepts_nested_attributes_for :procedures, allow_destroy: true



end
