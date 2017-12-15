require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../models/album.rb')

class TestAlbum < Minitest::Test

  def setup
    @album = Album.new({"title" => "Nicola Benedetti Homecoming: A Scottish Fantasy", "artist_id" => 1, "genre_id" => 1})
  end

  def test_album_has_title()
    assert_equal("Nicola Benedetti Homecoming: A Scottish Fantasy", @album.title)
  end

  def test_album_has_artist_id()
    assert_equal(1, @album.artist_id)
  end

end
