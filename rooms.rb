class Room
attr_reader(:name, :capacity, :fee, :till, :music, :people_in)


def initialize(name, capacity, fee)
  @name = name
  @capacity = capacity
  @fee = fee
  @till = 0
  @music = []
  @people_in = []
end

  def add_people(person)
    @people_in.push(person)
  end

  def remove_people(person)
    if person != nil
    @people_in.delete(person)
  else
    "Sorry, that person is not in the room"
    end
  end

  def add_song(song)
    if song != nil
    @music.push(song)
  else
    "Sorry, that song is not available"
    end
  end

  def check_if_space_available
    if @capacity > @people_in.length
      return true
    else
      return false
    end
  end

  def add_money
    @till += @fee
  end



  def sell_ticket(customer)
    if customer.can_afford(self) && check_if_space_available
      add_money
      customer.remove_money(@fee)
      add_people(customer)
      customer.check_if_song(self)
    elsif customer.can_afford(self) == false
      "Sorry you dont have enough money!"
    elsif check_if_space_available == false
      "Sorry there is not more space in this room!"
    end
  end

end
