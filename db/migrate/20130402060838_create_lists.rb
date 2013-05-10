class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :string_custom_field_1_name
      t.string :string_custom_field_2_name
      t.string :string_custom_field_3_name
      t.string :integer_custom_field_1_name
      t.string :integer_custom_field_2_name
      t.string :integer_custom_field_3_name
      t.string :datetime_custom_field_1_name
      t.string :datetime_custom_field_2_name
      t.string :datetime_custom_field_3_name
      t.integer :rating
      t.timestamps
    end
  end
end
