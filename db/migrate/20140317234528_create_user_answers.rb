class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.boolean :correct
      t.integer :time

      t.timestamps
    end
  end
end
