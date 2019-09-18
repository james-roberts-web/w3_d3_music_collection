require_relative('./artist.rb')
require_relative('./album.rb')
require('pry')

artist1 = Artist.new({
  'artist_name' => 'INV1'
  })
artist2 = Artist.new({
  'artist_name' => 'Apples and Bananas'
  })

artist1.save
artist2.save



album1 = Album.new({
  'album_name' => 'Forever North',
  'genre' => 'Trance',
  'artist_id' => artist1.id
  })

album2 = Album.new({
  'album_name' => 'Forever South: The Sequel',
  'genre' => 'Trance',
  'artist_id' => artist1.id
  })

album3 = Album.new({
  'album_name' => 'Late Night Fruit Bowl',
  'genre' => 'Techno',
  'artist_id' => artist2.id
  })

album4 = Album.new({
  'album_name' => 'Midnight Shake',
  'genre' => 'Country',
  'artist_id' => artist2.id
  })

album1.save
album2.save
album3.save
album4.save


artist1.albums_by_artist_id
artist2.albums_by_artist_id

album3.artist

artist1.artist_by_artist_id

album3.album_by_album_id
# album1.delete
# artist1.delete

binding.pry


# p artist1
# p artist2
