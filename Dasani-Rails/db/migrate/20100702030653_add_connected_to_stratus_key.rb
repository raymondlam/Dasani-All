class AddConnectedToStratusKey < ActiveRecord::Migration
  def self.up
    add_column :stratus_keys, :connected, :boolean
  end

  def self.down
    remove_column :stratus_keys, :connected
  end
end