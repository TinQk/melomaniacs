### SEED TEST

# Define parameters
nb_artists = 10
nb_genres = 3
nb_artist_genres = 2

# Create genres
nb_genres.times do |i|
  g = Genre.create(
    name: "genre_#{i+1}"
    )
end

# Create artists
nb_artists.times do |i|
  a = Artist.create(
    name: "artist_#{i+1}",
    spotify_id: "spotify_#{i+1}"
    )
  a.genres << Genre.find((i%nb_genres)+1)
end
