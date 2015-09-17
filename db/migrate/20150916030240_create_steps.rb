class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :title
      t.text :detail
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
