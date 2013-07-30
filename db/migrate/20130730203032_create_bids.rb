class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.decimal :maximum_bid, precision: 8, scale: 2
      t.decimal :lowest_bid, precision: 8, scale: 2
      t.text :additional_offers
      t.references :auction

      t.timestamps
    end
    add_index :bids, :auction_id
  end
end
