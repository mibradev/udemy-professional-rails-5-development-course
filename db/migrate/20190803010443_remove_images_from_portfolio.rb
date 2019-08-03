class RemoveImagesFromPortfolio < ActiveRecord::Migration[6.0]
  def change
    remove_column :portfolios, :main_image, :string
    remove_column :portfolios, :thumb_image, :string
  end
end
