require_relative '../views/appointments_view'

class AppointmentsController
  def initialize(appointment_repository, doctor_repository, patient_repository)
    @appointment_repository = appointment_repository
    @doctor_repository = doctor_repository
    @patient_repository = patient_repository
    @view = AppointmentsView.new
    @doctors_view = DoctorsView.new
    @patients_view = PatientsView.new
  end

  def create
    # 1. Listar e selecionar um doctor
    doctors = @doctor_repository.all
    @doctors_view.list(doctors)
    index = @doctors_view.ask_index
    doctor = doctors[index]

    # 2. Listar e selecionar um patient
    patients = @patient_repository.all
    @patients_view.list(patients)
    index = @patients_view.ask_index
    patient = patients[index]


    # 3. Perguntar a data do appointment
    date = @view.ask_date

    # 4. Criar uma nova instância
    appointment = Appointment.new(patient:, doctor:, date:)


    # 5. Adicionar appointment ao repository
    @appointment_repository.add(appointment)
  end

  def list
    appointments = @appointment_repository.all
    @view.list(appointments)
  end

end
