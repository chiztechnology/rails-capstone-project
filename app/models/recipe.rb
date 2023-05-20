class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: { only_inter: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { only_inter: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true

  def toggle_shopping_tag!
    update(shopping_tag: !shopping_tag)
  end
end
