class CreateConnections < ActiveRecord::Migration
  def self.up
    create_table :connections do |t|
      t.integer :stratus_key_id
      t.integer :peer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :connections
  end
end
