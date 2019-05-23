class Plan < ApplicationRecord
  extend Enumerize
  enumerize :stripe_plan_id, in: %i[free start]
end
