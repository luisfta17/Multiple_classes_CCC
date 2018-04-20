require("minitest/autorun")
require("minitest/rg")
require_relative("../songs")
require_relative("../guests")
require_relative("../rooms")


class GuestTest < MiniTest::Test
  def setup
    @song1 = Song.new("Yellow")
    @guest1= Guest.new("Luis T", @song1, 20)
    @guest2= Guest.new("Luis TT", @song1, 2)
    @room1  = Room.new("Cool room", 2, 8)
  end

  def test_guest_fav_song
    assert_equal(@song1, @guest1.fav_song)
  end
  def test_guest_name
    assert_equal("Luis T", @guest1.name)
  end

  def test_guest_money
    assert_equal(20, @guest1.wallet)
  end

def test_subtract
   assert_equal(15, @guest1.remove_money(5))
end

def test_can_afford__true
  assert_equal(true, @guest1.can_afford(@room1))
end

def test_can_afford__false
  assert_equal(false, @guest2.can_afford(@room1))
end

def test_check_fav_song
  @room1.add_song(@song1)
  assert_equal("yaasss my fav song is here!", @guest1.check_if_song(@room1))
end


end
