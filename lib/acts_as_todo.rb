module ActiveRecord
  module Acts
    
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        def aatd(options = {})
          has_many :todos, :as => :work
          include ActiveRecord::Acts::Work::InstanceMethods
        end
        
        def work_to_do()
          has_many :todos, :as => :worker
          include ActiveRecord::Acts::Worker::InstanceMethods         
        end
      end
            
      module Work
        module InstanceMethods
          def list_of_work
            todos
          end
          
          def todays_works
            todos.where(:start_date => Date.today)
          end
        end
 
      end # InstanceMethods
      
      module Worker
        module InstanceMethods
          def work_to_do
            todos
          end
          
          def todays_works
            todos.where(:start_date => Date.today)
          end
        end
      end
    
  end
end
