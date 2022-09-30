class Task < ApplicationRecord
    belongs_to :user, default: -> { Current.user } 
    validates :task, presence: true
    validates :date, date: {after_or_equal_to: proc { Time.zone.today }}, if: -> {date.present?}
    enum status: {incomplete: 0, complete: 1}
end
