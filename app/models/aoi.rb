class Aoi
  include Mongoid::Document

  field :locations, type: Array
  field :title, type: String
  field :categories, type: Array

  belongs_to :user
  has_and_belongs_to_many :discovered_pois, class_name: 'Poi'

end
