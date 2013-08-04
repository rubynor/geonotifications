
class PoiJob

  def self.send_poi_mails
    User.all.each do |user|
      puts "user: ", user.inspect
      puts "aois: ", user.aois.inspect
      user.aois.each do |aoi|
        pois = Poi.within_polygon(location: aoi.locations).not.in(_id: aoi.discovered_poi_ids)
        aoi.discovered_pois << pois
        aoi.save!
        PoiMailer.pois_email(user, aoi, pois).deliver unless pois.empty?
      end
    end
  end

end