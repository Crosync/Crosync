class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.integer :client_id
      t.string :sitename
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :sites
  end
end
