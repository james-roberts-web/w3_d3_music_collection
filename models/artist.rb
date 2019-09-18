require_relative('../db/sql_runner.rb')
require_relative('./artist.rb')
require_relative('./album.rb')

class Artist

  attr_accessor :artist_name
  attr_reader :id

  def initialize (details)
    @id = details['id'].to_i if details['id']
    @artist_name = details['artist_name']
  end

  def save
    sql = "INSERT INTO artists (artist_name)
    VALUES ($1) RETURNING id"
    values = [@artist_name]
    new_save = SqlRunner.run(sql, values)
    @id = new_save[0]['id']
  end

  def Artist.all
    sql = "SELECT * FROM artists"
    all_artists = SqlRunner.run(sql)
    return all_artists.map{|artist|Artist.new(artist)}
  end


  def albums_by_artist_id
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    hashes_arr = SqlRunner.run(sql, values)
    return hashes_arr.map{|album|Album.new(album)}
  end


end
