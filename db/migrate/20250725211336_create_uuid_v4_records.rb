class CreateUuidV4Records < ActiveRecord::Migration[8.0]
  def change
    create_table :uuid_v4_records, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string :name
      t.timestamps
    end
  end
end
