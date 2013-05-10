class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.integer :list_id
      t.string :name
      t.string :email
      t.date :birthday
      t.string :status
      t.datetime :last_activity
      t.integer :rating
      t.string :language
      t.text :history
      t.string :string_custom_field_1
      t.string :string_custom_field_2
      t.string :string_custom_field_3
      t.integer :integer_custom_field_1
      t.integer :integer_custom_field_2
      t.integer :integer_custom_field_3
      t.datetime :datetime_custom_field_1
      t.datetime :datetime_custom_field_2
      t.datetime :datetime_custom_field_3

      t.timestamps
    end
  end
end
