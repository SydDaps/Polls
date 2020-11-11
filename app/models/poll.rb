class Poll < ApplicationRecord
  belongs_to :organizer
  has_many :sections, :dependent => :destroy
  has_many :voters, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  accepts_nested_attributes_for :sections
  has_one_attached :voters_csv

  # validates :end_at, presence: true, on: :update
  # validates :start_at, presence: true, on: :update
end
