class CreatePaymentNotifications < ActiveRecord::Migration
  def self.up
    create_table :payment_notifications do |t|
      t.text :params
      t.column :cart_id, :bigint
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :payment_notifications
  end
end
