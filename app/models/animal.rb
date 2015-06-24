class Animal < ActiveRecord::Base
  has_many :sightings, dependent: :destroy
  validates :name, presence: true
end
