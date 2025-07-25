class CreateUuidV7Records < ActiveRecord::Migration[8.0]
  def change
    create_table :uuid_v7_records, id: :uuid do |t|
      t.string :name
      t.timestamps
    end
  end
end
