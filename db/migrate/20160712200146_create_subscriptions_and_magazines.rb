class CreateSubscriptionsAndMagazines < ActiveRecord::Migration[5.0]
  def change
    create_table :magazines do |t|
      t.string :name
      t.boolean :color
      t.boolean :large
    end

    create_table :subscriptions do |t|
      t.references :person, foreign_key: true
      t.references :magazine, foreign_key: true
      t.datetime :start_on
      t.datetime :end_on

      t.timestamps
    end
  end
end
