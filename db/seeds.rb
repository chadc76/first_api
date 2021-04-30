# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
User.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')
puts 'Creating Users'
u1 = User.create!(username: 'chad')
u2 = User.create!(username: 'kenny')
u3 = User.create!(username: 'paige')
u4 = User.create!(username: 'tricia')

Artwork.destroy_all
Artwork.connection.execute('ALTER SEQUENCE artworks_id_seq RESTART WITH 1')
puts 'Creating Artworks'
a1 = Artwork.create!(title: "appacademy", artist_id: u1.id, image_url: 'http://appacademy.io')
a2 = Artwork.create!(title: "facebook", artist_id: u2.id, image_url: 'http://facebook.com')
a3 = Artwork.create!(title: "spotify", artist_id: u3.id, image_url: 'https://www.spotify.com/us')
a4 = Artwork.create!(title: "foxnews", artist_id: u4.id, image_url: 'https://www.foxnews.com')
a5 = Artwork.create!(title: "espn", artist_id: u2.id, image_url: 'https://www.espn.com')
a6 = Artwork.create!(title: "google", artist_id: u2.id, image_url: 'https://www.google.com')
a7 = Artwork.create!(title: "twitter", artist_id: u2.id, image_url: 'https://twitter.com')
a8 = Artwork.create!(title: "tumblr", artist_id: u1.id, image_url: 'https://tumblr.com')
a9 = Artwork.create!(title: "instagram", artist_id: u2.id, image_url: 'https://www.instagram.com')
a10 = Artwork.create!(title: "tiktok", artist_id: u4.id, image_url: 'https://www.tiktok.com')

ArtworkShare.destroy_all
ArtworkShare.connection.execute('ALTER SEQUENCE artwork_shares_id_seq RESTART WITH 1')
puts 'Creating Artwork Shares'
ArtworkShare.create!(viewer_id: u4.id, artwork_id: a1.id)
ArtworkShare.create!(viewer_id: u4.id, artwork_id: a2.id)
ArtworkShare.create!(viewer_id: u2.id, artwork_id: a3.id)
ArtworkShare.create!(viewer_id: u4.id, artwork_id: a3.id)
ArtworkShare.create!(viewer_id: u1.id, artwork_id: a4.id)
ArtworkShare.create!(viewer_id: u1.id, artwork_id: a5.id)
ArtworkShare.create!(viewer_id: u3.id, artwork_id: a5.id)
ArtworkShare.create!(viewer_id: u3.id, artwork_id: a6.id)
ArtworkShare.create!(viewer_id: u4.id, artwork_id: a7.id)
ArtworkShare.create!(viewer_id: u4.id, artwork_id: a8.id)
ArtworkShare.create!(viewer_id: u4.id, artwork_id: a9.id)
ArtworkShare.create!(viewer_id: u2.id, artwork_id: a10.id)
ArtworkShare.create!(viewer_id: u3.id, artwork_id: a1.id)
ArtworkShare.create!(viewer_id: u3.id, artwork_id: a2.id)
ArtworkShare.create!(viewer_id: u3.id, artwork_id: a4.id)
ArtworkShare.create!(viewer_id: u3.id, artwork_id: a7.id)
ArtworkShare.create!(viewer_id: u3.id, artwork_id: a8.id)
ArtworkShare.create!(viewer_id: u3.id, artwork_id: a9.id)
ArtworkShare.create!(viewer_id: u3.id, artwork_id: a10.id)
ArtworkShare.create!(viewer_id: u4.id, artwork_id: a5.id)
ArtworkShare.create!(viewer_id: u4.id, artwork_id: a6.id)

Comment.destroy_all
Comment.connection.execute('ALTER SEQUENCE comments_id_seq RESTART WITH 1')
puts 'Creating Comments'
Comment.create!(user_id: u4.id, artwork_id: a1.id, body: "Cool Art Bro")
Comment.create!(user_id: u4.id, artwork_id: a2.id, body: "Cool Art Man")
Comment.create!(user_id: u2.id, artwork_id: a3.id, body: "Cool Art Dude")
Comment.create!(user_id: u4.id, artwork_id: a3.id, body: "Cool Art My Guy")
Comment.create!(user_id: u1.id, artwork_id: a4.id, body: "Cool Art My Dude")
Comment.create!(user_id: u1.id, artwork_id: a5.id, body: "Cool Art My Man")
Comment.create!(user_id: u3.id, artwork_id: a5.id, body: "Cool Art Broski")
Comment.create!(user_id: u3.id, artwork_id: a6.id, body: "Cool Art Homie")
Comment.create!(user_id: u4.id, artwork_id: a7.id, body: "Cool Art Brotha")
Comment.create!(user_id: u4.id, artwork_id: a8.id, body: "Cool Art Fam")
Comment.create!(user_id: u4.id, artwork_id: a9.id, body: "Cool Art Buddy")
Comment.create!(user_id: u2.id, artwork_id: a10.id, body: "Cool Art Pal")

Like.destroy_all
Like.connection.execute('ALTER SEQUENCE likes_id_seq RESTART WITH 1')
puts 'Creating Likes'
Like.create!(user_id: 4, likeable_id: 1, likeable_type: "Artwork")
Like.create!(user_id: 3, likeable_id: 1, likeable_type: "Comment")
Like.create!(user_id: 4, likeable_id: 2, likeable_type: "Artwork")
Like.create!(user_id: 3, likeable_id: 2, likeable_type: "Comment")
Like.create!(user_id: 4, likeable_id: 3, likeable_type: "Artwork")
Like.create!(user_id: 3, likeable_id: 3, likeable_type: "Comment")
Like.create!(user_id: 3, likeable_id: 4, likeable_type: "Comment")
Like.create!(user_id: 4, likeable_id: 5, likeable_type: "Artwork")
Like.create!(user_id: 3, likeable_id: 5, likeable_type: "Comment")
Like.create!(user_id: 4, likeable_id: 6, likeable_type: "Artwork")
Like.create!(user_id: 3, likeable_id: 6, likeable_type: "Comment")
Like.create!(user_id: 4, likeable_id: 7, likeable_type: "Artwork")
Like.create!(user_id: 4, likeable_id: 8, likeable_type: "Artwork")
Like.create!(user_id: 4, likeable_id: 9, likeable_type: "Artwork")
Like.create!(user_id: 3, likeable_id: 9, likeable_type: "Comment")
Like.create!(user_id: 3, likeable_id: 10, likeable_type: "Comment")
Like.create!(user_id: 3, likeable_id: 11, likeable_type: "Comment")
Like.create!(user_id: 3, likeable_id: 12, likeable_type: "Comment")