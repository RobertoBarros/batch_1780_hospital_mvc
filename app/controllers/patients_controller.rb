require_relative '../views/patients_view'

class PatientsController
  def initialize(patient_repository, room_repository)
    @patient_repository = patient_repository
    @room_repository = room_repository
    @view = PatientsView.new
    @rooms_view = RoomsView.new
  end

  def create
    # 1. Perguntar o nome e a idade do patient
    name = @view.ask_name
    age = @view.ask_age

    # 1.1 - Mostrar todos os Rooms
    rooms = @room_repository.all
    @rooms_view.list(rooms)

    # 1.2 - Perguntar em qual room adicionar o patient
    index = @rooms_view.ask_index
    room = rooms[index]


    # 2. Cria uma nova instância de patient
    patient = Patient.new(name: name, age: age)

    # 2.1 - Adicionar o patient ao room
    room.add_patient(patient)

    # 3. Add ao repository a instância de patient
    @patient_repository.add(patient)
  end

  def list
    patients = @patient_repository.all
    @view.list(patients)
  end
end
