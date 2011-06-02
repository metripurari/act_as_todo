class Todo < ActiveRecord::Base
  belongs_to :work, :polymorphic => true
  belongs_to :user
  

end
