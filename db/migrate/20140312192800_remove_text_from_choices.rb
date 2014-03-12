class RemoveTextFromChoices < ActiveRecord::Migration
  def change
    remove_column :choices, :text, :string
  end
end
