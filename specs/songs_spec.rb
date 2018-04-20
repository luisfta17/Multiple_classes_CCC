require("minitest/autorun")
require("minitest/rg")
require_relative("../songs")
require_relative("../guests")
require_relative("../rooms")


class SongsTest < MiniTest::Test
  def setup
    @song1 = Song.new("Yellow")
  end

  def test_song_name
    assert_equal("Yellow", @song1.name)
  end



end
