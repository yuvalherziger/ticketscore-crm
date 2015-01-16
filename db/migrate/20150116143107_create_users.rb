class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userName
      t.string :email
      t.binary :password
      t.boolean :isActive

      t.timestamps null: false
    end
  end
end
