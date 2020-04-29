class CreateTellers < ActiveRecord::Migration[6.0]
  def change
    create_table :tellers do |t|
      t.datetime :date
      t.decimal :opening, default: 0.0
      t.decimal :cash_in, default: 0.0
      t.decimal :cash_out, default: 0.0
      t.references :user, null: false
      t.references :company, null: false
      t.references :country, null: false

      t.timestamps
    end
    add_index :tellers, :date
    add_index :tellers, :opening
    add_index :tellers, :cash_in
    add_index :tellers, :cash_out
  end
end
