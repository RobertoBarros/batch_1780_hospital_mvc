class Appointment
  attr_reader :patient, :doctor, :date
  attr_accessor :id
  def initialize(attributes = {})
    @id = attributes[:id]
    @date = attributes[:date]
    @patient = attributes[:patient]
    @doctor = attributes[:doctor]
  end
end
