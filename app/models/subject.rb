class Subject < ActiveRecord::Base
  has_many :steps
  validates :name, presence: true
end
