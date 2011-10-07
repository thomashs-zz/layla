class CreateTravels < ActiveRecord::Migration
  def self.up
    create_table :travels do |t|
      t.string :title
      t.decimal :original_price
      t.decimal :price
      t.integer :discount
      t.integer :stay_length
      t.integer :people
      t.string :location
      t.string :accomodation
      t.string :transportation
      t.string :destiny_type
      t.datetime :starts_at
      t.datetime :ends_at
      t.datetime :coupon_ends_at

      t.timestamps
    end
  end

  def self.down
    drop_table :travels
  end
end
