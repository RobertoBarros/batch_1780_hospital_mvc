require_relative '../models/room'

class RoomRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    load_csv if File.exist?(@csv_file)
    @next_id = @rooms.empty? ? 1 : @rooms.last.id + 1
  end

  def add(room)
    room.id = @next_id
    @rooms << room
    save_csv
    @next_id += 1
  end

  def all
    @rooms
  end

  def find(id)
    @rooms.find { |room| room.id == id }
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      room = Room.new(id: row[:id].to_i, number: row[:number].to_i, capacity: row[:capacity].to_i)
      @rooms << room
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb', headers: :first_row, header_converters: :symbol) do |file|
      file << %i[id number capacity] # CSV HEADER

      @rooms.each do |room|
        file << [room.id, room.number, room.capacity]
      end
    end
  end
end
