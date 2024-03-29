require 'spec_helper'

describe PoiJob do

  it "should send email for new points of interest in area" do
    poi1 = create :poi, location: [59.1350, 9.6]
    poi2 = create :poi, location: [59.1365, 9.7], title: 'garasjen'
    poi3 = create :poi, location: [59.1375, 9.7], title: 'hytta'

    user = create :user

    aoi = create :aoi, user: user, discovered_pois: [poi1], locations: [[59.1370, 9.75],
                                                                  [59.1370, 9.5],
                                                                  [59.1340, 9.5],
                                                                  [59.1340, 9.75]]
    ActionMailer::Base.deliveries.count.should == 1

    PoiJob.send_poi_mails

    aoi.reload
    aoi.discovered_pois.should include(poi1)
    aoi.discovered_pois.should include(poi2)
    aoi.discovered_pois.should_not include(poi3)

    ActionMailer::Base.deliveries.count.should == 2
  end
end