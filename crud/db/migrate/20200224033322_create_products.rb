class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|

      t.string :name
      t.text :desi
      t.text :sale
      t.text :add
      t.text :phone
      t.text :city
      t.text :short_description
      t.text :full_description
    end
  end
end
