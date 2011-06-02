class ActsAsTodoMigration < ActiveRecord::Migration
  def self.up    
    create_table :todos do |t|
    	t.integer :user_id
      t.integer :rateable_id
      t.datetime :started_at
      t.datetime :end_at
      t.timestamps
    end
  end
  
  def self.down
    drop_table :todos
  end
end