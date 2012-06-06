class Todo < ActiveRecord::Base
  
  STATUS = ["urgent", "normal", "low", "waiting"]
  belongs_to :work, :polymorphic => true
  belongs_to :worker, :polymorphic => true
  has_many :sub_tasks
  #option can have {:status => , :worker => , :work => , :end_date => , :start_date =>}
  def reestimate(options = {:start_date => Date.today, :end_date => Date.today})
    update_attributes(options)
  end
  
  def create_sub_task
    sub_tasks.create
  end   
end


