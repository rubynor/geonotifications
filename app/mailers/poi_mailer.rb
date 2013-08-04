class PoiMailer < ActionMailer::Base
  default from: "from@example.com"

  def pois_email(user, aoi, pois)
    @user = user
    @aoi = aoi
    @pois = pois
    mail(to: @user.email, subject: "Here's some point of interests")
  end
end
