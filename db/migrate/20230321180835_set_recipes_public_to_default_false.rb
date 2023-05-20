class SetRecipesPublicToDefaultFalse < ActiveRecord::Migration[7.0]
  def change
    change_column_default :recipes, :public, from: nil, to: false
  end
end
