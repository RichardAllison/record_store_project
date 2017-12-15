require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../models/artist.rb')

class TestArtist < Minitest::Test

  def setup
    @artist = Artist.new({"name" => "Nicola Benedetti", "type" => "soloist"})
  end

  def test_artist_has_name()
    assert_equal("Nicola Benedetti", @artist.name)
  end

  def test_artist_has_type()
    assert_equal("Nicola Benedetti", @artist.name)
  end

end
