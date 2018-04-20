require("minitest/autorun")
require("minitest/rg")
require_relative("../songs")
require_relative("../guests")
require_relative("../rooms")


class RoomsTest < MiniTest::Test
  def setup
    @song1  = Song.new("Yellow")
    @song2  = Song.new("American Idiot")
    @song3  = Song.new("Basket case")
    @guest1 = Guest.new("Luis T", @song1, 20)
    @guest2 = Guest.new("Peter J", @song2, 20)
    @guest3 = Guest.new("Andreu", @song3, 20)
    @guest4 = Guest.new("Andreu", @song2, 2)
    @room1  = Room.new("Cool room", 2, 8)
  end

def test_room_name
  assert_equal("Cool room", @room1.name)
end

def test_room_capacity
  assert_equal(2, @room1.capacity)
end

def test_room_fee
  assert_equal(8, @room1.fee)
end

def test_room_songs
  assert_equal(0, @room1.music.length)
end

def test_room_till
  assert_equal(0, @room1.till)
end

def test_room_total_guests
  assert_equal(0, @room1.people_in.length)
end

def test_add_people
  @room1.add_people(@guest1)
  assert_equal(1, @room1.people_in.length)
end

def test_remove_people
  @room1.add_people(@guest1)
  @room1.add_people(@guest2)
  @room1.add_people(@guest3)
  @room1.remove_people(@guest3)
  assert_equal(2, @room1.people_in.length)
end

def test_add_song
  @room1.add_song(@song1)
  assert_equal(1, @room1.music.length)
end

def test_space_available__true
assert_equal(true, @room1.check_if_space_available)
end

def test_space_available__false
  @room1.add_people(@guest1)
  @room1.add_people(@guest2)
  @room1.add_people(@guest3)
assert_equal(false, @room1.check_if_space_available)
end

def test_add_money_till
  @room1.add_money
  assert_equal(8, @room1.till)
end


def test_sell_ticket__true
@room1.add_song(@song1)
@room1.sell_ticket(@guest1)
assert_equal(8, @room1.till)
assert_equal(12, @guest1.wallet)
assert_equal(1, @room1.people_in.length)
assert_equal("yaasss my fav song is here!", @guest1.check_if_song(@room1))
end

def test_sell_ticket__false
  @room1.add_people(@guest2)
  @room1.add_people(@guest3)
  @room1.sell_ticket(@guest1)
assert_equal(2, @room1.people_in.length)
assert_equal(0, @room1.till)
assert_equal(20, @guest1.wallet)
end

def test_sell_ticket__false
  @room1.add_people(@guest2)
  @room1.add_people(@guest3)
assert_equal("Sorry there is not more space in this room!", @room1.sell_ticket(@guest1))
assert_equal(2, @room1.people_in.length)
assert_equal(0, @room1.till)
assert_equal(20, @guest1.wallet)
end

def test_sell_ticket__no_money
assert_equal("Sorry you dont have enough money!", @room1.sell_ticket(@guest4))
assert_equal(0, @room1.people_in.length)
assert_equal(0, @room1.till)
assert_equal(2, @guest4.wallet)
end

end
