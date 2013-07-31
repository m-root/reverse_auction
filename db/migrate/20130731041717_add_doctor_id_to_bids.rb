class AddDoctorIdToBids < ActiveRecord::Migration
  def change
    add_column :bids, :doctor_id, :integer
    add_index :bids, :doctor_id
  end
end
