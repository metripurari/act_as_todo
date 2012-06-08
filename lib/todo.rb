class Todo < ActiveRecord::Base
  
  STATUS = ["urgent", "normal", "low", "waiting"]
  belongs_to :work, :polymorphic => true
  belongs_to :worker, :polymorphic => true
  has_many :sub_tasks, :dependent => :destroy
  
  default_scope :order => 'end_date ASC'
  
  scope :completed, :conditions => { :completed => true }, :order => 'end_date ASC'
  scope :not_completed, :conditions => { :completed => true }, :order => 'start_date DESC'
  #option can have {:status => , :worker => , :work => , :end_date => , :start_date =>}
  def reestimate(options = {:start_date => Date.today, :end_date => Date.today})
    update_attributes(options)
  end
  
  def create_sub_task
    sub_tasks.create
  end
  
  def method_missing(meth, *args, &block)
    if TodoState::States.keys.include(meth)
      if TodoState.can_change_state(meth, self)
        self.update_attribute(:state, meth)
      else
        self.errors.add(:state, "State Cannot Changed from #{self.state} to #{meth}. Available stated to change are #{TodoState.States[self.state]}")
      end
    else
      super
    end    
  end
  
  def all_states
    TodoState::States
  end
  
  def available_states
    TodoState::States[self.state]
  end
end


