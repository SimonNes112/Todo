class Task < ApplicationRecord
    belongs_to :user, default: -> { Current.user } 
    
    STATUSES = [:false, :true]
end
