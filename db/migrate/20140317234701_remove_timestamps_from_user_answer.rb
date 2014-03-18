class RemoveTimestampsFromUserAnswer < ActiveRecord::Migration
  def change
    remove_column :user_answers, :created_at, :string
    remove_column :user_answers, :updated_at, :string
  end
end
