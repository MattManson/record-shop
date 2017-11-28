require("minitest/autorun")
require("minitest/rg")
require_relative("../models/album.rb")

class TestAlbum <MiniTest::Test

  def setup
    @album = Album.new({
      "title" => "Vengeful Ascension",
      "artist" => 1,
      "quantity" => 500,
      "buy_price" => 300,
      "sell_price" => 1000,
      "genre" => "Blackened Death Metal"
      })
  end

  def test_markup
    assert_equal(30.00, @album.markup)
  end

  def test_stock_level
    assert_equal("high", @album.stock_level)
  end

end
