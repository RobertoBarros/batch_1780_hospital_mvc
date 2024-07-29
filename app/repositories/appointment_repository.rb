require_relative '../models/appointment'

class AppointmentRepository
  def initialize(csv_file, patient_repository, doctor_repository)
    @csv_file = csv_file
    @patient_repository = patient_repository
    @doctor_repository = doctor_repository
    @appointments = []
    load_csv if File.exist?(@csv_file)
    @next_id = @appointments.empty? ? 1 : @appointments.last.id + 1
  end

  def add(appointment)
    appointment.id = @next_id
    @appointments << appointment
    save_csv
    @next_id += 1
  end

  def all
    @appointments
  end

  def find(id)
    @appointments.find { |appointment| appointment.id == id }
  end


  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|

      patient = @patient_repository.find(row[:patient_id].to_i)
      doctor = @doctor_repository.find(row[:doctor_id].to_i)

      appointment = Appointment.new(id: row[:id].to_i, date: row[:date], doctor: doctor, patient: patient)
      @appointments << appointment
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb', headers: :first_row, header_converters: :symbol) do |file|

      file << %i[id date patient_id doctor_id] # CSV HEADER

      @appointments.each do |appointment|
        file << [appointment.id, appointment.date, appointment.patient.id, appointment.doctor.id]
      end
    end
  end
end
