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
        
        def work_to_do()
          has_many :todos, :foreign_key => :ref_id
          class_name = self.to_s.underscore
          Todo.class_eval do
           belongs_to class_name.to_sym
          end
        end
      end
            
      module InstanceMethods
 
      end # InstanceMethods
      
    end
  end
end
