require 'spec_helper'

describe Poi do

  let(:poi1) { create :poi, location: [59.1350, 9.6] }
  let(:poi2) { create :poi, location: [59.1365, 9.7], title: 'garasjen'}
  let(:poi3) { create :poi, location: [59.1375, 9.7], title: 'hytta' }

  it 'should find points of interest by area' do
    aoi = create :aoi, locations: [[59.1370, 9.75],
                                   [59.1370, 9.5],
                                   [59.1340, 9.5],
                                   [59.1340, 9.75]]

    pois = Poi.within_polygon(location: aoi.locations)

    pois.should include(poi1)
    pois.should include(poi2)
    pois.should_not include(poi3)

  end


  it 'should not find points of interest by area with unordered locations' do
    aoi = create :aoi, locations: [
        [59.1340, 9.75],
        [59.1370, 9.5],
        [59.1340, 9.5],
        [59.1370, 9.75]
    ]

    pois = Poi.within_polygon(location: aoi.locations)

    pois.should_not include(poi1)
    pois.should_not include(poi2)
    pois.should_not include(poi3)

  end

end
