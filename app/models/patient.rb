class Patient
  attr_reader :name, :age
  attr_accessor :room, :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @age = attributes[:age]
  end

end

# roberto = Patient.new({name: 'Roberto', age: 18})
# roberto = Patient.new(name: 'Roberto', age: 18)
