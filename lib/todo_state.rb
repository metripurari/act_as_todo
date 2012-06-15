class TodoState
  attr_accessor :method, :todo
  States = {:new => [:start, :onhold],
            :start => [:complete, :onhold],
            :complete => [:restart],
            :onhold => [:start, :complete],
            :restart =>[:start]}
end