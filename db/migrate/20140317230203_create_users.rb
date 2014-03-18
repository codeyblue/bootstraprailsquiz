class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :number_correct
      t.integer :time

      t.timestamps
    end
  end
end
