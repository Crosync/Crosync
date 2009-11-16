class CreateVobs < ActiveRecord::Migration
  def self.up
    create_table :vobs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :vobs
  end
end
