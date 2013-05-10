class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.integer :subscriber_id
      t.integer :campaign_id
      t.integer :list_id
      t.string :email
      t.string :token
      t.datetime :opened_at
      t.datetime :clicked_at
      t.datetime :unsubscribed_at
      t.datetime :bounced_at
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
