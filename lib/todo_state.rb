class TodoState
  attr_accessor :method, :todo
  States = {:new => [],
            :started => [:new, :onhold, :restarted],
            :completed => [:onhold, :started],
            :onhold => [:started, :new],
            :restarted =>[:completed]}
  
  def can_change_state?
    States[:method].include(todo.state)      
  end
  
end