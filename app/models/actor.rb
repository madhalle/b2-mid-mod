class Actor < ApplicationRecord
  validates_presence_of :name

  has_many :movies

  def self.average_age
    average(:age)
  end
end
