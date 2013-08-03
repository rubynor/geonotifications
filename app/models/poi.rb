class Poi
  include Mongoid::Document
  field :location, type: Array
  field :category, type: String
  field :title, type: String
  field :description, type: String

  belongs_to :created_by, class_name: 'User'

  validates :location, presence: true, length: {is: 2 }
  validates :category, presence: true
  index({ location: "2d" }, { min: -200, max: 200 })
  index({ category: 1})

  def latitude
    location[0]
  end

  def longtitude
    location[1]
  end
end
