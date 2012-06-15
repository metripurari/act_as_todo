class TodoState
  attr_accessor :method, :todo
  States = {:new => [:start, :onhold],
            :start => [:complete, :onhold],
            :complete => [:restart],
            :onhold => [:start, :complete],
            :restart =>[:start]}
  
  def self.hange_state?
    States[:method].include?(todo.state)      
  end
  
end