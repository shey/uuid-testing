class CreateMixedUuidRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :mixed_uuid_records, id: :uuid do |t|
      t.string :name
      t.timestamps
    end
  end
end
