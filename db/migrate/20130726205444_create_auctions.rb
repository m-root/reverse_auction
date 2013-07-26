class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :service
      t.text :description

      t.timestamps
    end
  end
end
