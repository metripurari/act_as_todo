require File.dirname(__FILE__) + '/lib/acts_as_todo'
ActiveRecord::Base.send(:include, ActiveRecord::Acts)
