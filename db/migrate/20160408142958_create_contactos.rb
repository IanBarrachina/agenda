class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.string :nombre
      t.string :apellidos
      t.string :email
      t.string :foto
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :tipo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
