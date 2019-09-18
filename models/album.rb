require_relative('../db/sql_runner.rb')
require_relative('./album.rb')
require_relative('./artist.rb')

class Album

  attr_accessor :album_name, :genre
  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @album_name = details['album_name']
    @genre = details['genre']
    @artist_id = details['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums (album_name, genre, artist_id)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@album_name, @genre, @artist_id]
    new_save = SqlRunner.run(sql, values)
    @id = new_save[0]['id']
  end

  def artist

    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artist_id_arr = SqlRunner.run(sql, values)

    return Artist.new(artist_id_arr[0])

  end



end
