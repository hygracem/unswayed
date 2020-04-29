class CreateReporters < ActiveRecord::Migration[5.2]
  def change
    create_table :reporters do |t|
      t.string :name
      t.string :media
      t.string :ideology
      t.integer :fact_check_rating

      t.timestamps
    end
  end
end
