class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.references :country, null: false
      t.references :user, null: false

      t.timestamps
    end
    add_index :companies, :name
  end
end
