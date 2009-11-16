class CreateOplogs < ActiveRecord::Migration
  def self.up
    create_table :oplogs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :oplogs
  end
end
