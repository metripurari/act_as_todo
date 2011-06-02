class Todo < ActiveRecord::Base
  belongs_to :work
  belongs_to :user
  

end
