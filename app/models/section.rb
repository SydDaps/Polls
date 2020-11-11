class Section < ApplicationRecord
  belongs_to :poll
  has_many :options, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  accepts_nested_attributes_for :options, allow_destroy: true
end
