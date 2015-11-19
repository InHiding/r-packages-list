class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :name
      t.string :email
      t.references :package, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
