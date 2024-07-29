class Room
  attr_reader :number, :capacity, :patients
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @number = attributes[:number]
    @capacity = attributes[:capacity] || 0
    @patients = []
  end

  def add_patient(patient)
    @patients << patient
    patient.room = self
  end
end


# roberto = Patient.new({name: 'Roberto', age: 18})
# room666 = Room.new(number: 666, capacity: 3)

# room666.add_patient(roberto)
# room666.patients # => [<patient>]

# roberto.room # => <room>
