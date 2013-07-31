class AddPatientIdToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :patient_id, :integer
    add_index :auctions, :patient_id
  end
end
