class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price, :precision => 8, :scale => 2
      t.string :version
      t.text :description
      t.string :image_url
      t.string :languages

      t.timestamps
    end
  end
end
