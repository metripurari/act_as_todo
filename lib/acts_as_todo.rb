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
        end
 
      end # InstanceMethods
      
      module Worker
        module InstanceMethods
        end
      end
    
  end
end
