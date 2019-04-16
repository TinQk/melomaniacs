# frozen_string_literal: true

class Recommendations
  def get_reco
    RSpotify.authenticate(Rails.application.credentials.spotify_client_id, Rails.application.credentials.spotify_client_secret)
    recommendations = RSpotify::Recommendations.generate(limit: 2, seed_artists: ['4NHQUGzhtTLFvgF5SZesLK', '1nJvji2KIlWSseXRSlNYsC'])
    recommendations
  end
end
