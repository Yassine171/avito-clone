class AddVilleRefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :ville, null: false, foreign_key: true
  end
end
