class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :list_id
      t.string :name
      t.string :from
      t.string :reply_to
      t.string :subject
      t.text   :body
      t.text   :body_txt
      t.datetime :schedule_for

      t.timestamps
    end
  end
end
