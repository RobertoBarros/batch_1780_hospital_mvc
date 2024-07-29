require_relative '../models/doctor'

class DoctorRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @doctors = []
    load_csv if File.exist?(@csv_file)
    @next_id = @doctors.empty? ? 1 : @doctors.last.id + 1
  end

  def add(doctor)
    doctor.id = @next_id
    @doctors << doctor
    save_csv
    @next_id += 1
  end

  def all
    @doctors
  end

  def find(id)
    @doctors.find { |doctor| doctor.id == id }
  end


  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      doctor = Doctor.new(id: row[:id].to_i, name: row[:name])
      @doctors << doctor
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb', headers: :first_row, header_converters: :symbol) do |file|

      file << %i[id name] # CSV HEADER

      @doctors.each do |doctor|
        file << [doctor.id, doctor.name]
      end
    end
  end
end
