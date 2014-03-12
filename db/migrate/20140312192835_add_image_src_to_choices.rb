class AddImageSrcToChoices < ActiveRecord::Migration
  def change
    add_column :choices, :image_src, :string
  end
end
