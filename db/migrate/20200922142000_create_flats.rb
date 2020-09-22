class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
