class Aoi
  include Mongoid::Document

  field :locations, type: Array
  field :title, type: String
  field :categories, type: Array

  belongs_to :user

end
