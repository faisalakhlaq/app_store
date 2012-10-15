class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :designation
      t.text :description
      t.string :interests
      t.string :image_url
      t.string :role

      t.timestamps
    end
  end
end
