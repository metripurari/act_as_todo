class Todo < ActiveRecord::Base
  
  STATUS = ["urgent", "normal", "low", "waiting"]
  belongs_to :work, :polymorphic => true
  belongs_to :worker, :polymorphic => true
  has_many :sub_tasks, :dependent => :destroy
  
  default_scope :order => 'started_at ASC'
  
  scope :completed, :conditions => { :completed => true }, :order => 'started_at ASC'
  scope :not_completed, :conditions => { :completed => true }, :order => 'started_at DESC'
  #option can have {:status => , :worker => , :work => , :end_date => , :start_date =>}
  def reestimate(options = {:started_at => Date.today, :end_at => Date.today})
    update_attributes(options)
  end
  
  def create_sub_task
    sub_tasks.create
  end
  
  def method_missing(meth, *args, &block)
    if TodoState::States.keys.include?(meth)
      if can_change_state?(meth)
        self.update_attributes(:status => meth, :completed => (meth == "complete"))
      else
        self.errors.add(:status, "State Cannot Changed from #{self.status} to #{meth}. Available stated to change are #{available_states}")
        return false
      end
    else
      super
    end    
  end
  
  def all_states
    TodoState::States
  end
  
  def available_states
    TodoState::States[self.status.to_sym]
  end
  
  def can_change_state?(state_to_change)
    available_states.include?(state_to_change.to_sym)      
  end
end


