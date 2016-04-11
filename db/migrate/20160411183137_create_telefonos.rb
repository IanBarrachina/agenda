class CreateTelefonos < ActiveRecord::Migration
  def change
    create_table :telefonos do |t|
      t.integer :numero
      t.belongs_to :contacto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
