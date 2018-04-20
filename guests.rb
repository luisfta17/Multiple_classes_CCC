require 'pry'

class Guest
attr_reader(:name, :fav_song, :wallet)


def initialize(name, fav_song, wallet)
  @name = name
  @fav_song = fav_song
  @wallet = wallet
end

def remove_money(amount)
  @wallet -= amount
end

def can_afford(room)
    if @wallet >= room.fee
      return true
    else
      return false
    end
  end

def check_if_song(room)
  # binding.pry
  if room.music.include?(@fav_song)
    "yaasss my fav song is here!"
  else
    "ohhh :( I dont see my fav song"
  end
end


end
