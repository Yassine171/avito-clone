class CreateAnnonces < ActiveRecord::Migration[6.1]
  def change
    create_table :annonces do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :etat
      t.string :type_transaction
      t.references :ville, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.json :additional_properties

      t.timestamps
    end
  end
end
