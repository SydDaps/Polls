class Vote < ApplicationRecord
  belongs_to :option
  belongs_to :voter
  belongs_to :section
  belongs_to :poll
end
