class CreateCaloriesBounds < ActiveRecord::Migration
  def change
    create_table :calories_bounds do |t|
      t.decimal :upper_bound
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
