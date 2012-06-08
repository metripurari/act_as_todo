class ActsAsTodoMigration < ActiveRecord::Migration
  def self.up
    unless table_exists?("todos")    
      create_table :todos do |t|
      	t.integer :worker_id
      	t.string :worker_type
        t.integer :work_id
        t.string :work_type
        t.integer :todo_id
        t.date :started_at
        t.date :end_at
        t.boolean :completed, :default => false
        t.string :status, :default => :new
        t.timestamps
      end
    else
      puts "Migration Already run please check Table has been created"
    end
  end
  
  def self.down
    unless table_exists?("todos")    
      puts "Migration not run to create todos table in schema please check Table has not been created"
    else
      drop_table :todos
    end
  end
end