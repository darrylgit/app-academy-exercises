require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = rooms.each { |key, value| rooms[key] = Room.new(value) } 
  end

  def name
    @name.split(" ").map { |word| word.capitalize }.join(" ")
  end

  def rooms
    @rooms
  end 

  def room_exists?(room)
    @rooms.has_key?(room)
  end

  def check_in(guest, room)
    if !room_exists?(room)
      puts "sorry, room does not exist"
      return
    end

    if @rooms[room].add_occupant(guest)
      puts "check in successful"
    else
      puts "sorry, room is full"
    end
  end

  def has_vacancy?
    @rooms.values.any? { |room| !room.full? }
  end

  def list_rooms
    @rooms.each do |key, room|
      puts key + ": " + room.available_space.to_s
    end
  end

end
