class CreateVilles < ActiveRecord::Migration[6.1]
  def change
    create_table :villes do |t|
      t.string :name

      t.timestamps
    end
  end
end
