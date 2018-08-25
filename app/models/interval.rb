class Interval < ApplicationRecord
  belongs_to :user, validate: true
  belongs_to :task, validate: true
end
