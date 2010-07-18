class CreateStratusKeys < ActiveRecord::Migration
  def self.up
    create_table :stratus_keys do |t|
      t.string :key
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :stratus_keys
  end
end
