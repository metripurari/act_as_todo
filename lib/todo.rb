class Todo < ActiveRecord::Base
  belongs_to :work, :polymorphic => true
end
