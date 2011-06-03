class Todo < ActiveRecord::Base
  belongs_to :work, :polymorphic => true
  belongs_to :worker, :polymorphic => true
end
