module ActiveRecord
  module Acts
    module Work
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        def aatd(options = {})
          has_many :todos, :as => :work
          include ActiveRecord::Acts::Work::InstanceMethods
        end
      end
            
      module InstanceMethods
 
      end # InstanceMethods
      
    end
  end
end
