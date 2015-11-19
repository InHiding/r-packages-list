class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.string :version
      t.date :publication
      t.text :title
      t.text :description

      t.timestamps null: false
    end
  end
end
