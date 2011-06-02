require File.expand_path('../../generators/acts_as_todo_migration/templates/migration.rb', __FILE__)
namespace :acts_as_todo do
  desc "Create the Schema for todo table"
   task :create do
     ActsAsTodoMigration.up
  end

  desc "Remove the Schema for todo table"
   task :roll_back do
     ActsAsTodoMigration.down
  end
end
