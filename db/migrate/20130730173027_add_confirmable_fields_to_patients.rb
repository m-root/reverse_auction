class AddConfirmableFieldsToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :confirmation_token, :string
    add_column :patients, :confirmed_at, :datetime
    add_column :patients, :confirmation_sent_at, :datetime
    add_column :patients, :unconfirmed_email, :string
  end
end
