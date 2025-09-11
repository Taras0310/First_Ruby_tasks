=begin
Create class Business
Business has name and workers
Business can print it's name and current amount of workers
Business can print information on all of workers attributes - each ones name, surname, specialization and salary

Create class WorkerAccountant
Has fixed salary per year attribute - 2000
WorkerAccountant has attributes - name, surname, experience, specialization
WorkerAccountant can print or return his salary
WorkerAccountant's salary is calculated based on formula - fixed salary per year * experience

Create class WorkerLawyer
Has fixed salary per year attribute - 3000
WorkerLayer has attributes - name, surname, experience, specialization
WorkerLayer can print or return his salary
WorkerLayer's salary is calculated based on formula - fixed salary per year * experience

Consider using inheritance
Consider in what types of variables should information be kept  
=end


class Worker #general class, describes Worker
  attr_reader :name, :surname, :experience, :specialization
  FIXED_SALARY_PER_YEAR = 2000 

  def initialize(name, surname, experience, specialization)
    @name = name
    @surname = surname
    @experience = experience
    @specialization = specialization
  end
  
  def salary
    result = self.class::FIXED_SALARY_PER_YEAR * @experience
    
    result
  end
  
end

class WorkerAccountant < Worker
  FIXED_SALARY_PER_YEAR = 2000  
end


class WorkerLawer < Worker
  FIXED_SALARY_PER_YEAR = 3000
end



class Business
  attr_reader :name, :workers
  
  
  def initialize(name, workers)
    @name = name
    @workers = workers
  end
  
  def count_workers #display current count of workers
    puts "#{@workers.size}"
  end
  
  def business_name #display the business name
    puts "#{@name}"
  end
  
  def print_workers_info
    puts "General information about our workers:"
    puts "\n"
    
    @workers.each do |item|
      puts "Name: #{item.name}"
      puts "Surname: #{item.surname}"
      puts "Experience: #{item.experience} year/s"
      puts "Specialization: #{item.specialization}"
      puts "Salary: #{item.salary}"
      puts "\n"
    end
  end
end

b = Business.new('IT', [
    WorkerAccountant.new('Taras', 'Yakushevych', 3, 'Main_accountant'),
    WorkerLawer.new('Yevhen', 'Gitt', 6, 'Main_lawer')
  ])

b.print_workers_info
b.business_name
b.count_workers


