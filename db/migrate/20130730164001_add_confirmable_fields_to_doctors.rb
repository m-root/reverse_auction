class AddConfirmableFieldsToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :confirmation_token, :string
    add_column :doctors, :confirmed_at, :datetime
    add_column :doctors, :confirmation_sent_at, :datetime
    add_column :doctors, :unconfirmed_email, :string
  end
end
