class CreateTreasures < ActiveRecord::Migration
  def self.up
    create_table :treasures do |t|
      t.string :name, :null => false, :limit => 200
      t.integer :value, :null => false, :default => 101

      t.timestamps
    end
  end

  def self.down
    drop_table :treasures
  end
end
