require 'spec_helper'

describe Poi do

  let(:poi1) { create :poi, location: [59.1350, 9.6] }
  let(:poi2) { create :poi, location: [59.1365, 9.7], title: 'garasjen' }
  let(:poi3) { create :poi, location: [59.1375, 9.7], title: 'hytta' }
  let(:aoi) { create :aoi, locations: [
      [59.1370, 9.75],
      [59.1370, 9.5],
      [59.1340, 9.75],
      [59.1340, 9.5]] }

  it 'should find both points of interest' do
    pois = Poi.within_polygon(location: aoi.locations)

    pois.should include(poi1)
    pois.should include(poi2)
    pois.should_not include(poi3)

  end

end
