require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../models/genre.rb')

class TestGenre < Minitest::Test

  def test_genre_has_name()
    genre = Genre.new({"name" => "Classical"})
    assert_equal("Classical", genre.name)
  end

end
