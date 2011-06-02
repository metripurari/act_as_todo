class ActsAsTodoMigration < ActiveRecord::Migration
  def self.up    
    create_table :todos do |t|
    	t.integer :user_id
      t.integer :work_id
      t.string :work_type
      t.datetime :started_at
      t.datetime :end_at
      t.timestamps
    end
  end
  
  def self.down
    drop_table :todos
  end
end