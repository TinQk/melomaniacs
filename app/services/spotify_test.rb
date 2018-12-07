class SpotifyTest
	def initialize
		
	end
	def loop
	  y = 0
	  i = []
	  RSpotify::authenticate("2fc8c7db0a584ecc97c8789e10b1ba14", "3e31ba14f979474ab69880fafd410829")
	  @result = RSpotify::Artist.search('SND').first
	  100000.times do
	    @result.related_artists.each do |x|
		  y += 1	
		  i << "#{x.name}"
		  puts x.name		
		  puts y
	    end
	  end
	end
	
end