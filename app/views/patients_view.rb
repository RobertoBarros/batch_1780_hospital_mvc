class PatientsView
  def ask_name
    puts 'Enter patient name:'
    gets.chomp.strip
  end

  def ask_age
    puts 'Enter patient age:'
    gets.chomp.to_i
  end

  def ask_index
    puts "Enter doctor number:"
    gets.chomp.to_i - 1
  end


  def list(patients)
    puts 'Patients List'
    puts '-' * 30
    patients.each_with_index do |patient, index|
      puts "#{index + 1} - Name: #{patient.name} | #{patient.age} years - Room: #{patient.room.number}"
    end
    puts '-' * 30
  end
end
