class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.references :author, foreign_key: { to_table: 'users' }
      t.string :name
      t.integer :amount
      t.references :group
      t.timestamps
    end
  end
end
