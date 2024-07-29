class DoctorsView
  def ask_name
    puts 'Enter doctor name:'
    gets.chomp.strip
  end

  def ask_index
    puts "Enter doctor number:"
    gets.chomp.to_i - 1
  end

  def list(doctors)
    puts 'Doctors List'
    puts '-' * 30

    doctors.each_with_index do |doctor, index|
      puts "#{index + 1} - #{doctor.name}"
    end

    puts '-' * 30
  end
end
