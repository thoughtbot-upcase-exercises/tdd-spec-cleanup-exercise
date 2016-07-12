class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.boolean :invited
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
